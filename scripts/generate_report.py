import argparse
import os
import sys

from armybuilder.report import generate_report

def main(argv):
    parser = argparse.ArgumentParser()
    parser.add_argument('--output-path', help='path to output generated', default=os.getcwd())

    args = parser.parse_args(argv)

    print(f'Saving file to {args.output_path}...')
    generate_report(args.output_path)
    print(f'Done generating report!')

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))