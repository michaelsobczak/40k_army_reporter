from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView
import os
from .models import Base, get_sqlalchemy_uri, Figure, Wargear, Keyword, Ability, Specialization, Tactic, Roster, RosterEntry, Faction

app = Flask(__name__)

def setup_app():
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.config['SECRET_KEY'] = 'you dont know this'
    app.config['SQLALCHEMY_DATABASE_URI'] = get_sqlalchemy_uri()
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


setup_app()


db = SQLAlchemy(app, model_class=Base)


# set up admin stuff
admin = Admin(app)

class RosterEntryView(ModelView):
    column_list = ['name', 'figure', 'specialization', 'roster', 'points', 'wargear']
    column_editable_list = ['name', 'figure', 'specialization', 'roster', 'wargear']

class RosterView(ModelView):
    column_list = ['name', 'player_name', 'factions', 'entries', 'points']
    column_editable_list = ['name', 'player_name', 'factions', 'entries']

class TacticView(ModelView):
    column_list = ['name', 'text', 'cost', 'factions']
    column_editable_list = ['name', 'text', 'cost', 'factions']

admin.add_view(ModelView(Figure, db.session, category='Pieces'))
admin.add_view(ModelView(Wargear, db.session, category='Pieces'))
admin.add_view(ModelView(Keyword, db.session, category='Metadata'))
admin.add_view(ModelView(Ability, db.session, category='Rules'))
admin.add_view(ModelView(Specialization, db.session, category='Rules'))
admin.add_view(TacticView(Tactic, db.session, category='Rules'))
admin.add_view(RosterView(Roster, db.session, category='Roster'))
admin.add_view(RosterEntryView(RosterEntry, db.session, category='Roster'))
admin.add_view(ModelView(Faction, db.session, category='Metadata'))




from . import views, report