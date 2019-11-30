import argparse
import os
import sys

from armybuilder import db
from armybuilder.models import Roster
from armybuilder.report import generate_report

def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output-dir', help='path to output generated', default=os.path.join(os.getcwd(), 'output'))
    parser.add_argument('--list-rosters', action='store_true', help='list available rosters')
    parser.add_argument('roster_id', help='roster id number')

    args = parser.parse_args(argv)

    if args.list_rosters:
        rosters = db.session.query(Roster).all()
        print('\n\t' + '\n\t'.join([ f'{r.id}: {r.name}' for r in rosters]))
        return 1

    print(f'Saving file to {args.output_dir}...')
    generate_report(args.output_dir, args.roster_id)
    print(f'Done generating report!')
    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))