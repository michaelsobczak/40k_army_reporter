from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, Integer, Text, create_engine
import os

DB_DIALECT = 'sqlite'
DB_PATH = os.path.join(os.environ['HOME'], '.armybuilder', 'db.sqlite')

def get_sqlalchemy_uri() -> str:
    # triple quotes for sqlite, update this with dialect change
    uri = f'{DB_DIALECT}:///{DB_PATH}'

    # For SQLite, make sure DB dir exists and create the tables
    # Update this if dialect changes
    if not os.path.exists(DB_PATH):
        db_dir = os.path.dirname(DB_PATH)
        if not os.path.exists(db_dir):
            os.makedirs(db_dir)
        os.system(f'touch "{DB_PATH}"')
        engine = create_engine(uri)
        Base.metadata.create_all(engine)

    return uri


Base = declarative_base()