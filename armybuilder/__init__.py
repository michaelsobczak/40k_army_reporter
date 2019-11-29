from flask import Flask
import os

app = Flask(__name__)

DB_PATH = os.path.join(os.environ['HOME'], '.armybuilder', 'db.sqlite')

if not os.path.exists(DB_PATH):
    db_dir = os.path.dirname(DB_PATH)
    if not os.path.exists(db_dir):
        os.makedirs(db_dir)

DB_CONNECTION_STRING = f'sqlite:///{DB_PATH}'

def setup_app():
    app.config['TEMPLATES_AUTO_RELOAD'] = True
    app.config['SECRET_KEY'] = 'you dont know this'
    app.config['SQLALCHEMY_DATABASE_URA'] = DB_CONNECTION_STRING

from . import views, report