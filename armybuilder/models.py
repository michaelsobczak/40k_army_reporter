from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, Text, create_engine, Table, Boolean, String
from sqlalchemy.orm import relationship
import os
from typing import Type
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash
DB_DIALECT = 'sqlite'
DB_PATH = os.path.join(os.path.dirname(__file__), '.db', 'db.sqlite')

def get_sqlalchemy_uri() -> str:
    # triple quotes for sqlite, update this with dialect change
    uri = f'{DB_DIALECT}:///{DB_PATH}'

    if 'RDS_HOSTNAME' in os.environ:
        print('Running on cloud, using database service...')
        host = os.environ['RDS_HOSTNAME']
        port = os.environ['RDS_PORT']
        name = os.environ['RDS_DB_NAME']
        username = os.environ['RDS_USERNAME']
        password = os.environ['RDS_PASSWORD']
        # postgresql://scott:tiger@localhost:5432/mydatabase
        uri = f'postgresql://{username}:{password}@{host}:{port}/{name}'
    else:
        print('No database service found, using sqlite...')
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

# Create user model.

def make_secondary_table(a: str, b: str) -> Table:
    table_name = f'{a}_{b}_secondary'
    association_table = Table(table_name, Base.metadata,
        Column(f'{a}_id', Integer, ForeignKey(f'{a}.id')),
        Column(f'{b}_id', Integer, ForeignKey(f'{b}.id'))
    )
    return association_table

figure_keyword_table = make_secondary_table('figure', 'keyword')
figure_ability_table = make_secondary_table('figure', 'ability')
figure_wargear_table = make_secondary_table('figure', 'wargear')
wargear_ability_table = make_secondary_table('wargear', 'ability')
roster_entry_wargear_table = make_secondary_table('rosterentry', 'wargear')
faction_ability_table = make_secondary_table('faction', 'ability')
figure_faction_table = make_secondary_table('figure', 'faction')
tactic_faction_table = make_secondary_table('tactic', 'faction')
roster_faction_table = make_secondary_table('roster', 'faction')
user_roster_table = make_secondary_table('user', 'roster')
user_role_table = make_secondary_table('user', 'role')
figure_specialization_table = make_secondary_table('figure', 'specialization')
class User(UserMixin, Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    username = Column(String(64), index=True, unique=True)
    email = Column(String(120), index=True, unique=True)
    password_hash = Column(String(128))

    rosters = relationship(
        'Roster',
        secondary=user_roster_table,
        back_populates='users'
    )
    def __repr__(self):
        return '<User {}>'.format(self.username)

    def __str__(self):
        return self.username

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)

    roles = relationship(
        'Role',
        secondary=user_role_table,
        back_populates='users'
    )

class Role(Base):
    __tablename__ = 'role'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    users = relationship(
        'User',
        secondary=user_role_table,
        back_populates='roles'
    )

    def __str__(self):
        return self.name

class Figure(Base):
    __tablename__ = 'figure'
    id = Column(Integer, primary_key=True)
    figure_type = Column(Text)
    figure_name = Column(Text)
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
    max_number = Column(Integer)
    allowed_wargear = relationship('Wargear', secondary=figure_wargear_table, back_populates='figures', lazy='subquery')
    allowed_specializations = relationship('Specialization',
        secondary=figure_specialization_table,
        back_populates='figures',
        lazy='subquery')
    factions = relationship(
        'Faction', secondary=figure_faction_table,
        back_populates='figures',
        lazy='subquery'
    )

    keywords = relationship(
        'Keyword',
        secondary=figure_keyword_table,
        back_populates='figures',
        lazy='subquery'
    )
    abilities = relationship(
        'Ability',
        secondary=figure_ability_table,
        back_populates='figures',
        lazy='subquery'
    )

    def __str__(self):
        return f'{self.figure_type if self.figure_type else ""} {self.figure_name if self.figure_name else ""}'

    @property
    def displayName(self):
        dn = self.figure_type
        if self.figure_name:
            dn += f' {self.figure_name}'
        return dn

class Wargear(Base):
    __tablename__ = 'wargear'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    profile = Column(Text)
    wargear_range = Column(Text)
    wargear_type = Column(Text)
    strength = Column(Text)
    ap = Column(Text)
    damage = Column(Text)
    points = Column(Integer)

    figures = relationship(
        'Figure',
        secondary=figure_wargear_table,
        back_populates='allowed_wargear',
        lazy='subquery'
    )

    abilities = relationship(
        'Ability',
        secondary=wargear_ability_table,
        back_populates='wargear',
        lazy='subquery'
    )

    roster_entries = relationship(
        'RosterEntry',
        secondary=roster_entry_wargear_table,
        back_populates='wargear',
        lazy='subquery'
    )

    def __str__(self):
        if self.profile:
            return f'{self.name} {self.profile}'
        else:
            return self.name

class Keyword(Base):
    __tablename__ = 'keyword'
    id = Column(Integer, primary_key=True)
    label = Column(Text)
    names = Column(Text)
    figures = relationship(
        'Figure',
        secondary=figure_keyword_table,
        back_populates='keywords',
        lazy='subquery'
    )

    def __str__(self):
        return self.label

class Ability(Base):
    __tablename__ = 'ability'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    text = Column(Text)

    wargear = relationship(
        'Wargear',
        secondary=wargear_ability_table,
        back_populates='abilities',
        lazy='subquery'
    )

    figures = relationship(
        'Figure',
        secondary=figure_ability_table,
        back_populates='abilities',
        lazy='subquery'
    )

    factions = relationship(
        'Faction',
        secondary=faction_ability_table,
        back_populates='abilities'
    )

    def __str__(self):
        return self.name

class Specialization(Base):
    __tablename__ = 'specialization'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    tactic_id = Column(Integer, ForeignKey('tactic.id'))
    tactic = relationship('Tactic')
    passive = Column(Text)

    figures = relationship('Figure', secondary=figure_specialization_table, back_populates='allowed_specializations', lazy='subquery')

    def __str__(self):
        return self.name
class Tactic(Base):
    __tablename__ = 'tactic'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    cost = Column(Integer)
    text = Column(Text)
    

    keyword_id = Column(Integer, ForeignKey('keyword.id'))
    keyword = relationship('Keyword')

    factions = relationship('Faction',
        secondary=tactic_faction_table,
        back_populates='tactics')


    specialization = relationship('Specialization')

    def __str__(self):
        return self.name
class Roster(Base):
    __tablename__ = 'roster'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    player_name = Column(Text)

    factions = relationship('Faction', secondary=roster_faction_table, back_populates='rosters', lazy='subquery')
    entries = relationship('RosterEntry', cascade='delete', lazy='subquery')

    users = relationship(
        'User',
        secondary=user_roster_table,
        back_populates='rosters'
    )
    def __str__(self):
        return self.name

    @property
    def points(self):
        return sum(e.points for e in self.entries)

class RosterEntry(Base):
    __tablename__ = 'rosterentry'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    figure_id = Column(Integer, ForeignKey('figure.id'))
    figure = relationship('Figure', lazy='subquery')

    specialization_id = Column(Integer, ForeignKey('specialization.id'))
    specialization = relationship('Specialization', lazy='subquery')

    roster_id = Column(Integer, ForeignKey('roster.id'))
    roster = relationship('Roster')

    wargear = relationship(
        'Wargear',
        secondary=roster_entry_wargear_table,
        back_populates='roster_entries',
        lazy='subquery'
    )

    def __str__(self):
        return self.name


    @property
    def points(self):
        wargear_points = sum([ w.points if w.points else 0 for w in self.wargear ]) if self.wargear else 0
        figure_points = self.figure.points if self.figure.points else 0
        return wargear_points + figure_points

class Faction(Base):
    __tablename__ = 'faction'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    keyword_id = Column(Integer, ForeignKey('keyword.id'))
    keyword = relationship('Keyword')

    is_subfaction = Column(Boolean, default=False)

    abilities = relationship('Ability', secondary=faction_ability_table, back_populates='factions', lazy='subquery')
    figures = relationship(
        'Figure', secondary=figure_faction_table,
        back_populates='factions'
    )
    tactics = relationship('Tactic',
        secondary=tactic_faction_table,
        back_populates='factions')

    rosters = relationship('Roster',
        secondary=roster_faction_table,
        back_populates='factions')

    def __str__(self):
        return self.name
