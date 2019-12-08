from armybuilder import db
from armybuilder.models import *
from sqlalchemy.sql.expression import func
import os, sys
import argparse
from typing import Dict
from collections import defaultdict
import json
import re
#TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'
TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'
#WARGEAR_REGEX = r'(?P<name>([ ]|[\S]+)+) (?P<range>([0-9]+"|Melee)) (?P<stats>([ ]|\S)+)'
WARGEAR_REGEX = r'(?P<name>(?:[ ]|\S)*) (?P<range>([0-9]+"|Melee)) (?P<stats>([ ]|\S)+)\n'
WARGEAR_STAT_REGEX = r'(?<wargear_type>[A-Z][a-zA-Z 0-9*]+) (?<strength>(?:User|[\-+x0-9*]+)) (?<ap>[\-+x0-9*]+) (?<damage>[D0-9*\-]+)(?<ability>[\S\- ]*)\n'
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
    clean_dict = {}
    if match_dict['name'].endswith('Melee'):
        clean_stats = 'Melee ' + match_dict['stats'].strip()
        if not (clean_stats.endswith('.') or clean_stats.endswith('-')):
            clean_stats = clean_stats + ' -'
        clean_stats = clean_stats.replace('  ', ' ')
        clean_dict['stats'] = clean_stats
        clean_dict['name'] = match_dict['name'].replace('Melee', '').strip()
    else:
        clean_dict['stats'] = match_dict['stats'].strip()
        clean_dict['name'] = match_dict['name'].strip()
    clean_dict['range'] = match_dict['range'].strip()
    return clean_dict

def parse_wargear_stats(stats_str: str) -> Dict[str, str]:
    if stats_str.startswith('of') or stats_str.startswith('from'):
        return None
    r = re.compile(WARGEAR_STAT_REGEX)
    m = r.match(stats_str)
    gd = m.groupdict()
    return gd


def parse_wargear(match_dict: Dict[str, str], matchstr: str) -> Wargear:
    md = clean_wargear_match_dict(match_dict)
    stats = parse_wargear_stats(md['stats'])
    if not stats:
        log_failure('wargear', 'stats string starting with "of"', matchstr, md)
        return None
    

def extract_tactics(corpus: str):
    r = re.compile(TACTIC_REGEX)
    tactic_string_match_groups = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in r.finditer(corpus)]
    print(f'Found {len(tactic_string_match_groups)} tactics...')
    tactics = [parse_tactic(mg, matchstr) for mg, matchstr in tactic_string_match_groups]


def extract_wargear(corpus:str):
    r = re.compile(WARGEAR_REGEX)
    wargear_string_match_groups = [(m.groupdict(), m.string[m.start(0):m.end(0)]) for m in r.finditer(corpus)]
    wargear = [parse_wargear(mg, matchstr) for mg, matchstr in wargear_string_match_groups]
    wargear = [w for w in wargear if w]
    print(f'Found {len(wargear_string_match_groups)} wargear...')


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

    from pprint import pprint
    pprint(_DB_ADD_RECORD)



if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
