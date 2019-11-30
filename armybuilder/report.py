from flask import render_template
from typing import Dict, Any
from sqlalchemy.sql.expression import func
import os
from . import app,db
from .models import *

def render_report_template(template_name: str, context: Dict[str, Any]) -> str:
    with app.app_context():
        return render_template(
            template_name, **context
        )

def generate_report(output_dir: str, roster_id: int) -> Dict[str, str]:

    # make the output dir if it exists
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    dummy_roster = db.session.query(Roster).get(roster_id)
    print(dummy_roster)
    def dummy_tactic():
        return db.session.query(Tactic).order_by(func.random()).first()
    
    def dummy_model():
        return db.session.query(Figure).order_by(func.random()).first()

    common_keyword = db.session.query(Keyword).filter_by(label='Common').first()
    if not common_keyword:
        print(f'No Common Keyword found, exiting')
        return
    common_faction = db.session.query(Faction).filter_by(keyword_id=common_keyword.id).first()
    if not common_faction:
        print(f'No Common Faction found, exiting')
    
    common_tactics = db.session.query(Tactic).filter(Tactic.factions.any(Faction.id == common_faction.id)).all()


    document_context_map = {
        'cheatsheet': {
            'common_tactics' : common_tactics,
            'faction_tactics' : [dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic()],
            'specialist_tactics' : [dummy_tactic(), dummy_tactic(),dummy_tactic(), dummy_tactic()],
            'unique_models' : [dummy_model(),dummy_model(),dummy_model()]
        },
        'datacards': {
            'roster' : dummy_roster,
        },
        'roster': {
            'roster' : dummy_roster
        }
    }

    report_data = {}
    # now render each of the templates and save the files
    for report, ctx in document_context_map.items():
        report_name = os.path.join(output_dir, f'{report}.html')
        template_name = os.path.join('report', f'{report}.html.jinja')
        print(f'Creating {report}...')
        with open(report_name, 'w') as report_outfile:
            report_html_string = render_report_template(template_name, ctx)
            report_outfile.write(report_html_string)
            report_data[report] = report_html_string
    return report_data

    


