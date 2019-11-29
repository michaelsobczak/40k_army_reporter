from flask import render_template
from typing import Dict, Any
import os
from . import app

def render_report_template(template_name: str, context: Dict[str, Any]) -> str:
    with app.app_context():
        return render_template(
            template_name, **context
        )

def generate_report(output_dir: str):

    # make the output dir if it exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # generate the a dictionary of document name to template context
    
    document_context_map = {
        'cheatsheet': {
            'cheatsheetRows': ['first', 'second', 'third']
        },
        'datacards': {},
        'roster': {}
    }

    # now render each of the templates and save the files
    for report, ctx in document_context_map.items():
        report_name = os.path.join(output_dir, f'{report}.html')
        template_name = os.path.join('report', f'{report}.html.jinja')
        print(f'Creating {report}...')
        with open(report_name, 'w') as report_outfile:
            report_html_string = render_report_template(template_name, ctx)
            report_outfile.write(report_html_string)

    


