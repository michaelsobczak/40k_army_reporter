from armybuilder import db
from armybuilder.models import *
from sqlalchemy.sql.expression import func
import os, sys
import argparse
from typing import Dict
from collections import defaultdict
import re
#TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'
TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'

_DB_ADD_RECORD = defaultdict(int)

def add_obj(obj: Base):
    db.session.add(obj)
    db.session.commit()
    _DB_ADD_RECORD[type(obj)] += 1


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


def get_or_create_tactic(match_dict: Dict[str, str]) -> Tactic:
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


def extract_tactics(corpus: str):
    r = re.compile(TACTIC_REGEX)
    tactic_match_groups = [m.groupdict() for m in r.finditer(corpus)]
    print(f'Found {len(tactic_match_groups)} tactics...')
    tactics = [get_or_create_tactic(tmg) for tmg in tactic_match_groups]


def parse_book(corpus: str):
    extract_tactics(corpus)


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
