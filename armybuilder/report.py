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
    
    dummy_ability = {
        'id' : 0,
        'name' : 'ABILITY_NAME',
        'text' : 'ABILITY_TEXT'
    }

    dummy_wargear = {
        'name' : 'WARGEAR_NAME',
        'range' : 'RANGE',
        'type' : 'HEAVY TYPE 6',
        'strength' : 'STRENGTH',
        'ap' : '-AP',
        'damage' : "DAMAGE",
        'abilities' : [dummy_ability]
    }

    dummy_tactic = {
        'id' : 0,
        'name' : 'TACTIC_NAME',
        'cost' : 2,
        'text' : 'TACTIC_TEXT',
        'faction' : 'TACTIC_FACTION'
    }

    dummy_specialization = {
        'id' : 0,
        'name' : 'SPECIALIZATION_NAME',
        'tactic' : dummy_tactic,
        'passive' : 'SPECIALIST_PASSIVE'
    }

    dummy_model = {
        'id' : 0,
        'name' : 'MODEL NAME',
        'model_type' : 'MODEL_TYPE',
        'wargear' : [dummy_wargear, dummy_wargear],
        'specialization' : dummy_specialization,
        'points' : 10,
        'move' : 5,
        'weapon_skill' : 3,
        'balistic_skill' : 5,
        'strength' : 4,
        'toughness' : 4,
        'wounds' : 1,
        'attacks' : 2,
        'leadership' : 6,
        'save' : 6,
        'abilities' : [dummy_ability],
        'faction' : 'MODEL_FACTION',
        'keywords' : ["Keyword1", "Keyword2"]

    }

    document_context_map = {
        'cheatsheet': {
            'cheatsheetRows': ['first', 'second', 'third'],
            'common_tactics' : [dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic],
            'faction_tactics' : [dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic],
            'specialist_tactics' : [dummy_tactic, dummy_tactic,dummy_tactic, dummy_tactic],
            'unique_models' : [dummy_model,dummy_model,dummy_model]
        },
        'datacards': {
            'models' : [dummy_model, dummy_model, dummy_model],
        },
        'roster': {
            'player_name' : 'Tychus Findlay',
            'kill_team_name' : 'Da Ladz',
            'faction' : 'Ork',
            'sub_faction' : 'Evil Sunz',
            'points' : '125',
            'models' : [dummy_model, dummy_model, dummy_model]
        }
    }

    # now render each of the templates and save the files
    for report, ctx in document_context_map.items():
        report_name = os.path.join(output_dir, f'{report}.html')
        template_name = os.path.join('report', f'{report}.html.jinja')
        print(f'Creating {report}...')
        with open(report_name, 'w') as report_outfile:
            report_html_string = render_report_template(template_name, ctx)
            report_outfile.write(report_html_string)

    


