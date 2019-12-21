from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, Text, create_engine, Table, Boolean, String
from sqlalchemy.orm import relationship
import os
from typing import Type
from flask_login import UserMixin
from werkzeug.security import generate_password_hash, check_password_hash

def get_sqlalchemy_uri() -> str:

    if 'RDS_HOSTNAME' in os.environ:
        print('Using RDS database...')
        host = os.environ['RDS_HOSTNAME']
        port = os.environ['RDS_PORT']
        name = os.environ['RDS_DB_NAME']
        username = os.environ['RDS_USERNAME']
        password = os.environ['RDS_PASSWORD']
        # postgresql://scott:tiger@localhost:5432/mydatabase
        uri = f'postgresql://{username}:{password}@{host}:{port}/{name}'
    else:
        print('No RDS database found, set RDS_ environment variables before running')
        uri = None

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
wargearprofile_ability_table = make_secondary_table('wargearprofile', 'ability')
figureprofile_ability_table = make_secondary_table('figureprofile', 'ability')
rosterentry_killteam_table = make_secondary_table('rosterentry', 'killteam')

class User(UserMixin, Base):
    __tablename__ = 'user'
    id = Column(Integer, primary_key=True)
    username = Column(String(64), index=True, unique=True)
    email = Column(String(120), index=True, unique=True)
    password_hash = Column(String(128))

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
    name = Column(Text)
    
    profiles = relationship('FigureProfile')
    default_wargear = relationship('Wargear', secondary=figure_wargear_table, back_populates='figures')
    specializations = relationship('Specialization',
        secondary=figure_specialization_table,
        back_populates='figures')
    factions = relationship(
        'Faction', secondary=figure_faction_table
        
    )

    keywords = relationship(
        'Keyword',
        secondary=figure_keyword_table,
        back_populates='figures'
        
    )
    abilities = relationship(
        'Ability',
        secondary=figure_ability_table,
        back_populates='figures'
        
    )

    def __str__(self):
        return f'{self.name}'

    @property
    def displayName(self):
        return self.name

    @property
    def jsondict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}




class FigureProfile(Base):
    __tablename__ = 'figureprofile'
    id = Column(Integer, primary_key=True)

    name = Column(Text)

    figure_id = Column(Integer, ForeignKey('figure.id'))
    figure = relationship('Figure')

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
    max_number = Column(Text)

    def __str__(self):
        return f'{self.name}'

    @property
    def jsondict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}


class Wargear(Base):
    __tablename__ = 'wargear'
    id = Column(Integer, primary_key=True, index=True)
    name = Column(Text)
    points = Column(Integer)
    text = Column(Text)

    profiles = relationship('WargearProfile')

    figures = relationship(
        'Figure',
        secondary=figure_wargear_table,
        back_populates='default_wargear',
        
    )

    abilities = relationship(
        'Ability',
        secondary=wargear_ability_table,
        back_populates='wargear',
        
    )

    roster_entries = relationship(
        'RosterEntry',
        secondary=roster_entry_wargear_table,
        back_populates='wargear',
        
    )

    def __str__(self):
        return self.name

    @property
    def jsondict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

class WargearProfile(Base):
    __tablename__ = 'wargearprofile'
    id = Column(Integer, primary_key=True, index=True)
    name = Column(Text)
    wargear_id = Column(Integer, ForeignKey('wargear.id'))
    wargear = relationship('Wargear')
    wargear_range = Column(Text)
    wargear_type = Column(Text)
    strength = Column(Text)
    ap = Column(Text)
    damage = Column(Text)

    abilities = relationship('Ability', secondary=wargearprofile_ability_table)

    def __str__(self):
        return f'{self.name} {self.wargear_range} {self.wargear_type} {self.strength} {self.ap} {self.damage}'

class Keyword(Base):
    __tablename__ = 'keyword'
    id = Column(Integer, primary_key=True)
    label = Column(Text)
    names = Column(Text)
    figures = relationship(
        'Figure',
        secondary=figure_keyword_table,
        back_populates='keywords'
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
        back_populates='abilities'
        
    )

    figures = relationship(
        'Figure',
        secondary=figure_ability_table,
        back_populates='abilities'
        
    )

    factions = relationship(
        'Faction',
        secondary=faction_ability_table
    )

    def __str__(self):
        return self.name

class Specialization(Base):
    __tablename__ = 'specialization'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    tactics = relationship('Tactic')
    passive = Column(Text)

    figures = relationship('Figure', secondary=figure_specialization_table, back_populates='specializations')

    def __str__(self):
        return self.name

    @property
    def jsondict(self):
        return {c.name: getattr(self, c.name) for c in self.__table__.columns}

class Tactic(Base):
    __tablename__ = 'tactic'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    cost = Column(Integer)
    text = Column(Text)
    level = Column(Integer)
    

    keyword_id = Column(Integer, ForeignKey('keyword.id'))
    keyword = relationship('Keyword')

    factions = relationship('Faction',
        secondary=tactic_faction_table)

    specialization_id = Column(Integer, ForeignKey('specialization.id'))
    specialization = relationship('Specialization')

    def __str__(self):
        return self.name
class Roster(Base):
    __tablename__ = 'roster'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    player_name = Column(Text)

    factions = relationship('Faction', secondary=roster_faction_table)
    entries = relationship('RosterEntry', cascade='delete')

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
    figure = relationship('Figure', )

    figureprofile_id = Column(Integer, ForeignKey('figureprofile.id'))
    profile = relationship('FigureProfile', lazy='subquery')

    specialization_id = Column(Integer, ForeignKey('specialization.id'))
    specialization = relationship('Specialization', )

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
        # wargear_points = sum([ w.points if w.points else 0 for w in self.wargear ]) if self.wargear else 0
        # figure_points = self.profile.points if self.profile and self.profile.points else 0
        # return int(wargear_points) + int(figure_points)
        return 1

class Faction(Base):
    __tablename__ = 'faction'
    id = Column(Integer, primary_key=True)
    name = Column(Text)

    keyword_id = Column(Integer, ForeignKey('keyword.id'))
    keyword = relationship('Keyword')

    is_subfaction = Column(Boolean, default=False)

    def __str__(self):
        return self.name


class Killteam(Base):
    __tablename__ = 'killteam'
    id = Column(Integer, primary_key=True)
    name = Column(Text)
    notes = Column(Text)
    roster_id = Column(Integer, ForeignKey('roster.id'))
    roster = relationship('Roster')

    team = relationship('RosterEntry', secondary=rosterentry_killteam_table)

