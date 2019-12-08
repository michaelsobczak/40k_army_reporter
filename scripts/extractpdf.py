
import tika
from tika import parser
import argparse
import sys, os
import json

def main(argv):
    p = argparse.ArgumentParser()
    p.add_argument('--output-dir', default='output')
    p.add_argument('pdf')
    args = p.parse_args(argv)

    parsed = parser.from_file(args.pdf)
    print(parsed["metadata"])
    print(parsed["content"])

    if not os.path.exists(args.output_dir):
        os.makedirs(args.output_dir)

    with open(os.path.join(args.output_dir, 'content.txt'), 'w') as f:
        f.write(parsed['content'])

    with open(os.path.join(args.output_dir, 'metadata.json'), 'w') as f:
        f.write(json.dumps(parsed['metadata']))

    return 0

if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
