from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, Text, create_engine, Table
from sqlalchemy.orm import relationship
import os
from typing import Type

DB_DIALECT = 'sqlite'
DB_PATH = os.path.join(os.path.dirname(__file__), '.db', 'db.sqlite')

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


def make_secondary_table(a: str, b: str) -> Table:
    table_name = f'{a}_{b}_secondary'
    association_table = Table(table_name, Base.metadata,
        Column(f'{a}_id', Integer, ForeignKey(f'{a}.id')),
        Column(f'{b}_id', Integer, ForeignKey(f'{b}.id'))
    )
    return association_table

figure_keyword_table = make_secondary_table('figure', 'keyword')
figure_ability_table = make_secondary_table('figure', 'ability')
wargear_ability_table = make_secondary_table('wargear', 'ability')
roster_entry_wargear_table = make_secondary_table('rosterentry', 'wargear')

class Figure(Base):
    __tablename__ = 'figure'
    id = Column(Integer, primary_key=True)
    figure_type = Column(Text)
    points = Column(Integer)
    move = Column(Text)
    weapon_skill = Column(Integer)
    ballistic_skill = Column(Integer)
    strength = Column(Text)
    toughness = Column(Text)
    wounds = Column(Text)
    attacks = Column(Text)
    leadership = Column(Text)
    save = Column(Text)

    keywords = relationship(
        'Keyword',
        secondary=figure_keyword_table,
        back_populates='figures')

    abilities = relationship(
        'Ability',
        secondary=figure_ability_table,
        back_populates='figures'
    )

class Wargear(Base):
    __tablename__ = 'wargear'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    wargear_range = Column(Text)
    wargear_type = Column(Text)
    strength = Column(Text)
    ap = Column(Text)
    damage = Column(Text)

    abilities = relationship(
        'Ability',
        secondary=wargear_ability_table,
        back_populates='wargear'
    )

    roster_entries = relationship(
        'RosterEntry',
        secondary=roster_entry_wargear_table,
        back_populates='wargear'
    )
class Keyword(Base):
    __tablename__ = 'keyword'
    id = Column(Integer, primary_key=True)
    label = Column(Text)

    figures = relationship(
        'Figure',
        secondary=figure_keyword_table,
        back_populates='keywords'
    )

class Ability(Base):
    __tablename__ = 'ability'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    text = Column(Text)

    wargear = relationship(
        'Wargear',
        secondary=wargear_ability_table,
        back_populates='abilities'
    )

    figures = relationship(
        'Figure',
        secondary=figure_ability_table,
        back_populates='abilities'
    )

class Specialization(Base):
    __tablename__ = 'specialization'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    tactic_id = Column(Integer, ForeignKey('tactic.id'))
    tactic = relationship('Tactic')

class Tactic(Base):
    __tablename__ = 'tactic'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    cost = Column(Integer)
    text = Column(Text)

    keyword_id = Column(Integer, ForeignKey('keyword.id'))
    keyword = relationship('Keyword')

class Roster(Base):
    __tablename__ = 'roster'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    entries = relationship('RosterEntry', cascade='delete')

class RosterEntry(Base):
    __tablename__ = 'rosterentry'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    figure_id = Column(Integer, ForeignKey('figure.id'))
    figure = relationship('Figure')

    specialization_id = Column(Integer, ForeignKey('specialization.id'))
    specialization = relationship('Specialization')

    roster_id = Column(Integer, ForeignKey('roster.id'))
    roster = relationship('Roster')

    wargear = relationship(
        'Wargear',
        secondary=roster_entry_wargear_table,
        back_populates='roster_entries'
    )

