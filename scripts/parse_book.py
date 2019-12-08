from armybuilder import db
from armybuilder.models import *
from sqlalchemy.sql.expression import func
import os, sys
import argparse
from typing import Dict, Union
from collections import defaultdict
import json
import re
#TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'
TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'
#WARGEAR_REGEX = r'(?P<name>([ ]|[\S]+)+) (?P<range>([0-9]+"|Melee)) (?P<stats>([ ]|\S)+)'
WARGEAR_REGEX = r'(?P<name>(?:[ ]|\S)*) (?P<range>([0-9]+"|Melee)) (?P<stats>([ ]|\S)+)\n'
WARGEAR_STAT_REGEX = r'(?P<wargear_type>[a-zA-Z 0-9*]*) (?P<strength>(?:User|[\-+x0-9*]+)) (?P<ap>[\-+x0-9*]+) (?P<damage>[D0-9*\-]+)(?P<ability>[\S\- ]*)'
PROFILED_WARGEAR_REGEX = r'(?P<name>[\S \-]+) (?P<rules>(?:When|This)[ \S]+)\n((- [\S ]+\n|\n))+'
_DB_ADD_RECORD = defaultdict(int)

def add_obj(obj: Base):
    db.session.add(obj)
    db.session.commit()
    _DB_ADD_RECORD[type(obj)] += 1


def log_failure(type: str, msg: str, matchstr: str, matchgroup: Dict[str, str], logfile: str = 'failure.csv'):
    with open(logfile, 'a') as f:
        f.write(f'"{type}", "{matchstr}", "{msg}"\n')

def get_or_create_keyword(keyword: str) -> Keyword:
    kw = keyword.title()
    k = db.session.query(Keyword).filter_by(label=kw).first()
    if not k:
        k = Keyword(
            label=kw
        )
        add_obj(k)
    return k


def get_or_create_faction(faction: str) -> Faction:
    f = faction.strip().title()
    faction = db.session.query(Faction).filter_by(name=f).first()
    if not faction:
        faction_keyword = get_or_create_keyword(f)
        faction = Faction(
            name=f,
            keyword_id=faction_keyword.id
        )
        add_obj(faction)
    return faction


def get_or_create_specialization(name: str) -> Specialization:
    n = name.strip().title()
    spec = db.session.query(Specialization).filter_by(name=n).first()
    if not spec:
        spec = Specialization(name=n)
        add_obj(spec)
    return spec

def get_or_create_ability(name: str, text: str) -> Ability:
    n = name.strip().title()
    ab = db.session.query(Ability).filter_by(name=n).first()
    if not ab:
        ab = Ability(name=n, text=text)
        add_obj(ab)
    return ab

def parse_tactic(match_dict: Dict[str, str], matchstr: str) -> Tactic:
    """ expecting keys to match group names of TACTIC_REGEX above """
    tname = match_dict['name'].strip('.').strip().title()
    ttext = match_dict['text'].strip().replace('\n', ' ').strip()
    tcost = int(match_dict['cost'].strip())
    tfaction = match_dict['faction'].strip('.').strip()
    tactic_args = {
        'name': tname,
        'cost': tcost,
        'text': ttext,
    }
    if tfaction.startswith('Level '):
        tfaction = re.sub(r'Level [0-9]+', '', tfaction)
        tactic_args['specialization_id'] = get_or_create_specialization(tfaction).id
    else:
        tactic_args['factions'] = [get_or_create_faction(tfaction)]
    tactic = db.session.query(Tactic).filter_by(name=tname).first()
    if not tactic:
        tactic = Tactic(
            **tactic_args
        )
        add_obj(tactic)
    return tactic


def clean_wargear_match_dict(match_dict: Dict[str, str]) -> Dict[str, str]:
    clean_dict = {
        'name': match_dict['name']
    }
    if 'Melee' in match_dict['name']:
        clean_stats = 'Melee ' + match_dict['stats'].strip()
        clean_dict['name'] = match_dict['name'].replace('Melee', '').strip()
    
    clean_stats = match_dict['stats'].strip()
    if not (clean_stats.endswith('.') or clean_stats.endswith('-')):
        clean_stats = clean_stats + ' -'
        clean_stats = clean_stats.replace('  ', ' ')
    
    if clean_stats.startswith('User'):
        clean_stats = 'Melee ' + clean_stats

    clean_dict['stats'] = clean_stats
    clean_dict['range'] = match_dict['range'].strip()
    return clean_dict

def swith(s, vals):
    return any([s.startswith(v) for v in vals])

def parse_wargear_stats(stats_str: str) -> Dict[str, str]:
    if swith(stats_str, ['or', 'you', 'of', ' '] + [str(s) for s in range(10)]):
        return None

    if stats_str.count(' ') < 5:
        return None

    r = re.compile(WARGEAR_STAT_REGEX)
    match_tuples = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in r.finditer(stats_str)]
    if not match_tuples:
        return None
    
    return match_tuples[0][0]


def parse_wargear(match_dict: Dict[str, str], matchstr: str) -> Union[Wargear, str]:
    md = clean_wargear_match_dict(match_dict)
    stats = parse_wargear_stats(md['stats'])
    if not stats:
        log_failure('wargear', 'stats string starting with "of"', matchstr, md)
        return None
    
    if md['name'].strip().startswith('- '):
        log_failure('wargear', 'wargear name indicates it is a profile', matchstr, md)
        return None

    
    new_wargear = Wargear(
        name=md['name']
    )
    add_obj(new_wargear)
    new_profile = WargearProfile(
        name='',
        wargear_id=new_wargear.id,
        wargear_range=match_dict['range'].strip(),
        wargear_type=stats['wargear_type'].strip(),
        strength=stats['strength'].strip(),
        ap=stats['ap'].strip(),
        damage=stats['damage'].strip(),
    )
    ab_text = stats['ability'].strip()
    if len(ab_text) > 4:
        wargear_ability = get_or_create_ability(name=md['name'], text=ab_text)
        new_profile.abilities = [wargear_ability]
    add_obj(new_profile)
    return new_wargear, match_dict['name'].replace('Melee', '').strip()
    

def extract_tactics(corpus: str):
    r = re.compile(TACTIC_REGEX)
    tactic_string_match_groups = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in r.finditer(corpus)]
    print(f'Found {len(tactic_string_match_groups)} tactics...')
    tactics = [parse_tactic(mg, matchstr) for mg, matchstr in tactic_string_match_groups]

def parse_profiled_wargear(mg, s):
    lines = [ l.strip() for l in s.strip().split('\n') if len(l.strip()) > 0 ]

    z = re.compile(WARGEAR_REGEX)

    search_text = '\n'.join([ x.replace('- ', '') for x in lines ])
    profile_matches = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in z.finditer(search_text)]
    profile_matches = [y for y in profile_matches if y]
    if len(profile_matches) < 1:
        return None

    w = Wargear(
        name=mg['name'].strip().title(),
        text=mg['rules'].strip()
    )
    add_obj(w)
    for gd, st in profile_matches:
        md = clean_wargear_match_dict(gd)
        stats = parse_wargear_stats(md['stats'])
        new_profile = WargearProfile(
            name='',
            wargear_id=w.id,
            wargear_range=md['range'].strip(),
            wargear_type=stats['wargear_type'].strip(),
            strength=stats['strength'].strip(),
            ap=stats['ap'].strip(),
            damage=stats['damage'].strip(),
        )
        ab_text = stats['ability'].strip()
        if len(ab_text) > 4:
            wargear_ability = get_or_create_ability(name=md['name'], text=ab_text)
            new_profile.abilities = [wargear_ability]
        add_obj(new_profile)
    
    return w, mg['name'].strip()



def extract_wargear(corpus:str):
    r = re.compile(WARGEAR_REGEX)
    q = re.compile(PROFILED_WARGEAR_REGEX)
    wargear_string_match_groups = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in r.finditer(corpus)]
    profiled_wargear_string_match_groups = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in q.finditer(corpus)]
    wargear = [parse_wargear(mg, matchstr) for mg, matchstr in wargear_string_match_groups]
    wargear = [b for b in wargear if b]
    profiled_wargear = [parse_profiled_wargear(mg, matchstr) for mg, matchstr in profiled_wargear_string_match_groups]
    profiled_wargear = [x for x in profiled_wargear if x]
    print(f'Found {len(wargear)} normal wargear items and {len(profiled_wargear)} wargear items with profiles')
    wargear_origname_tuples = [w for w in wargear + profiled_wargear if w]

    # find the point costs
    for wg, origname in wargear_origname_tuples:
        wg_cost_regex = re.compile(f'{origname} ([0-9]+)\n')
        wg_cost_matches = [ m.string[m.start(1):m.end(1)] for m in wg_cost_regex.finditer(corpus)]
        if not wg_cost_matches:
            print(f'no cost for {wg.name} found')
            continue
        # if len(wg_cost_matches) > 1:
        #     print(f'found multiple costs for {wg.name}: {wg_cost_matches}')
        wg.points = int(wg_cost_matches[0])
    db.session.commit()


def parse_book(corpus: str):
    extract_tactics(corpus)
    extract_wargear(corpus)


def main(argv):
    p = argparse.ArgumentParser()
    p.add_argument('--output-dir', default='output')
    p.add_argument('book_textfile')
    args = p.parse_args(argv)
    
    
    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    with open(args.book_textfile) as f:
        text = f.read()

    parse_book(text)

    print('Parsing report:')
    for k, v in _DB_ADD_RECORD.items():
        s = str(k).replace("<class 'armybuilder.models.", "").replace("'>", "")
        print(f'\tadded {v} {s} items')



if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
