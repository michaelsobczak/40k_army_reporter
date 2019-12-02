from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView
from flask_login import LoginManager
import flask_restless
import os
from .models import Base, get_sqlalchemy_uri, Figure, Wargear, Keyword, Ability, Specialization, Tactic, Roster, RosterEntry, Faction, User, Role

app = Flask(__name__)

def setup_app():
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.config['SECRET_KEY'] = 'you dont know this'
    app.config['SQLALCHEMY_DATABASE_URI'] = get_sqlalchemy_uri()
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False


setup_app()


db = SQLAlchemy(app, model_class=Base)
login = LoginManager(app)

@login.user_loader
def load_user(id):
    return db.session.query(User).get(int(id))

# set up admin stuff
admin = Admin(app, name='Admin')

class ArmybuilderModelView(ModelView):
    can_export = True

class RosterEntryView(ArmybuilderModelView):
    column_list = ['name', 'figure', 'specialization', 'roster', 'points', 'wargear']
    column_editable_list = ['name', 'figure', 'specialization', 'roster', 'wargear']

class RosterView(ArmybuilderModelView):
    column_list = ['name', 'player_name', 'factions', 'entries', 'users', 'points']
    column_editable_list = ['name', 'player_name', 'factions', 'entries', 'users']

class TacticView(ArmybuilderModelView):
    column_searchable_list = (Tactic.name, Tactic.text, Tactic.cost)
    column_filters = ['name','text', 'cost']
    column_list = ['name', 'text', 'cost', 'factions', 'specialization']
    column_editable_list = ['name', 'text', 'cost', 'factions', 'specialization']


class UserView(ArmybuilderModelView):
    column_list = ['username', 'email', 'roles', 'rosters']
    column_editable_list = ['username', 'email', 'roles', 'rosters']

admin.add_view(ArmybuilderModelView(Figure, db.session, category='Pieces'))
admin.add_view(ArmybuilderModelView(Wargear, db.session, category='Pieces'))
admin.add_view(ArmybuilderModelView(Keyword, db.session, category='Metadata'))
admin.add_view(ArmybuilderModelView(Ability, db.session, category='Rules'))
admin.add_view(ArmybuilderModelView(Specialization, db.session, category='Rules'))
admin.add_view(TacticView(Tactic, db.session, category='Rules'))
admin.add_view(RosterView(Roster, db.session, category='Roster'))
admin.add_view(RosterEntryView(RosterEntry, db.session, category='Roster'))
admin.add_view(ArmybuilderModelView(Faction, db.session, category='Metadata'))
admin.add_view(UserView(User, db.session, category='User'))
admin.add_view(ArmybuilderModelView(Role, db.session, category='User'))

manager = flask_restless.APIManager(app, session=db.session)
manager.create_api(Roster, methods=['GET', 'POST', 'PUT', 'DELETE'])
manager.create_api(RosterEntry, allow_delete_many=True, methods=['GET', 'POST', 'PUT', 'DELETE'])
manager.create_api(Specialization, results_per_page=-1, methods=['GET', 'POST', 'PUT', 'DELETE'])
manager.create_api(Wargear, results_per_page=-1,  methods=['GET', 'POST', 'PUT', 'DELETE'])
manager.create_api(Figure, results_per_page=-1, methods=['GET', 'POST', 'PUT', 'DELETE'])
from . import views, report