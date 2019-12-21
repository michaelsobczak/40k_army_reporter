from flask import render_template
from typing import Dict, Any
from sqlalchemy.sql.expression import func
import os
import pdfkit
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

    roster = db.session.query(Roster).get(roster_id)
    print(roster)
   
    # common_keyword = db.session.query(Keyword).filter_by(label='Common').first()
    # if not common_keyword:
    #     print("Common keyword null")
    #     return
    # common_faction = db.session.query(Faction).filter_by(keyword_id=common_keyword.id).first()
    # if not common_faction:
    #     print(f'No Common Faction found, exiting')
    
    common_tactics = db.session.query(Tactic).filter(Tactic.factions == None).all()


    # loop through factions and find the tactics that match
    faction_tactics = []
    print(roster.factions)
    for f in roster.factions:
        faction_tactics += db.session.query(Tactic).filter(Tactic.factions.any(Faction.id == f.id)).all()
    faction_tactics = []

    specialist_tactics = []
    model_id_map = {}
    print(roster)
    for roster_entry in roster.entries:
        print("DEBUGGING SPECIALIST TACTICS")
        # print(roster_entry.specialization.tactics)
        if roster_entry.specialization:
            tactics = db.session.query(Tactic).all()
            print("Tactics")
            print(tactics)
            specialist_tactics = []
            for tactic in tactics:
                print(tactic)
                if tactic.specialization_id == roster_entry.specialization.id:
                    specialist_tactics.append(tactic)
        model_id_map[roster_entry.figure.id] = roster_entry.figure
    

    document_context_map = {
        'cheatsheet': {
            'roster' : roster,
            'common_tactics' : common_tactics,
            'faction_tactics' : faction_tactics,
            'specialist_tactics' : specialist_tactics,
            'unique_models' : list(model_id_map.values())
        },
        # 'datacards': {
        #     'roster' : roster,
        # },
        'roster': {
            'roster' : roster
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
            download_pdf = False
            if download_pdf:
                print(report_html_string, template_name)
                pdfkit.from_string(report_html_string, f'{report}.pdf')
            
    return report_data

    


