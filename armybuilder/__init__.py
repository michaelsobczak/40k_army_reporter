from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_admin import Admin
from flask_admin.contrib.sqla import ModelView
import os
from .models import Base, get_sqlalchemy_uri, Figure, Wargear, Keyword, Ability, Specialization, Tactic, Roster, RosterEntry

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
admin.add_view(ModelView(Figure, db.session))
admin.add_view(ModelView(Wargear, db.session))
admin.add_view(ModelView(Keyword, db.session))
admin.add_view(ModelView(Ability, db.session))
admin.add_view(ModelView(Specialization, db.session))
admin.add_view(ModelView(Tactic, db.session))
admin.add_view(ModelView(Roster, db.session))
admin.add_view(ModelView(RosterEntry, db.session))




from . import views, report