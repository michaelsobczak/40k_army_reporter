from armybuilder import db
from armybuilder.models import *
from sqlalchemy.sql.expression import func
import os, sys
import argparse
from typing import Dict
import re
TACTIC_REGEX = r'(?P<name>[^a-z]+)\n\n(?P<faction>([ ]|\S)+) Tactic\n(?P<text>([.]|.|(\n[^\n]))*)\n{2}(?P<cost>[0-9]+).*'


def get_or_create_keyword(keyword: str) -> Keyword:
    kw = keyword.title()
    k = db.session.query(Keyword).filter_by(label=kw).first()
    if not k:
        print(f'No existing keyword {kw} found, creating it...')
        k = Keyword(
            label=kw
        )
        db.session.add(k)
        db.session.commit()
    return k


def get_or_create_faction(faction: str) -> Faction:
    f = faction.title()
    faction = db.session.query(Faction).filter_by(name=f).first()
    if not faction:
        print(f'No existing faction {f} found, creating it...')
        faction_keyword = get_or_create_keyword(f)
        faction = Faction(
            name=f,
            keyword_id=faction_keyword.id
        )
        db.session.add(faction)
        db.session.commit()
    return faction


def get_or_create_tactic(match_dict: Dict[str, str]) -> Tactic:
    """ expecting keys to match group names of TACTIC_REGEX above """
    tname = match_dict['name'].title()
    ttext = match_dict['text'].replace('\n', ' ')
    tcost = int(match_dict['cost'].strip())
    tactic = db.session.query(Tactic).filter_by(name=tname).first()
    if not tactic:
        print(f'No existing tactic {tname} found, creating it...')
        tactic = Tactic(
            name=tname,
            cost=tcost,
            text=ttext,
            factions=[get_or_create_faction(match_dict['faction'])]
        )
        db.session.add(tactic)
        db.session.commit()
    return tactic


def extract_tactics(corpus: str):
    r = re.compile(TACTIC_REGEX)
    tactic_match_groups = [m.groupdict() for m in r.finditer(corpus)]
    print(f'Found {len(tactic_match_groups)} tactics...')
    tactics = [get_or_create_tactic(tmg) for tmg in tactic_match_groups]
    print('\n'.join([str(t) for t in tactics]))

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



if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
