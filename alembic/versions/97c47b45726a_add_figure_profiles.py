"""add figure profiles

Revision ID: 97c47b45726a
Revises: 1f1a96be81ed
Create Date: 2019-12-08 17:53:11.520218

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '97c47b45726a'
down_revision = '1f1a96be81ed'
branch_labels = None
depends_on = None



def upgrade():
    op.create_table('figureprofile',
        sa.Column('id', sa.Integer(), nullable=False, primary_key=True),
        sa.Column('name', sa.Text(), nullable=True),
        sa.Column('figure_id', sa.Integer(), nullable=True),
        sa.Column('points', sa.Text(), nullable=True),
        sa.Column('move', sa.Text(), nullable=True),
        sa.Column('weapon_skill', sa.Text(), nullable=True),
        sa.Column('ballistic_skill', sa.Text(), nullable=True),
        sa.Column('strength', sa.Text(), nullable=True),
        sa.Column('toughness', sa.Text(), nullable=True),
        sa.Column('wounds', sa.Text(), nullable=True),
        sa.Column('attacks', sa.Text(), nullable=True),
        sa.Column('leadership', sa.Text(), nullable=True),
        sa.Column('save', sa.Text(), nullable=True),
        sa.Column('max_number', sa.Text(), nullable=True),
        sa.ForeignKeyConstraint(['figure_id'], ['figure.id'], ),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table('figureprofile_ability_secondary',
        sa.Column('figureprofile_id', sa.Integer(), nullable=True),
        sa.Column('ability_id', sa.Integer(), nullable=True),
        sa.ForeignKeyConstraint(['figureprofile_id'], ['figureprofile.id'], ),
        sa.ForeignKeyConstraint(['ability_id'], ['ability.id'], )
    )

    op.add_column('rosterentry', sa.Column('figureprofile_id', sa.Integer()))
    op.create_foreign_key(u'rosterentry_figureprofile_id_fkey', 'rosterentry', 'figureprofile', ['figureprofile_id'], ['id'])

    op.alter_column('figure', 'figure_type', new_column_name='name')
    op.drop_column('figure', 'figure_name')
    op.drop_column('figure', 'points')
    op.drop_column('figure', 'move')
    op.drop_column('figure', 'weapon_skill')
    op.drop_column('figure', 'ballistic_skill')
    op.drop_column('figure', 'strength')
    op.drop_column('figure', 'toughness')
    op.drop_column('figure', 'wounds')
    op.drop_column('figure', 'attacks')
    op.drop_column('figure', 'leadership')
    op.drop_column('figure', 'save')
    op.drop_column('figure', 'max_number')



    
def downgrade():
    op.alter_column('figure', 'name', new_column_name='figure_type')
    op.add_column('figure', sa.Column('figure_name', sa.Text()))
    op.add_column('figure', sa.Column('points', sa.Text()))
    op.add_column('figure', sa.Column('move', sa.Text()))
    op.add_column('figure', sa.Column('weapon_skill', sa.Text()))
    op.add_column('figure', sa.Column('ballistic_skill', sa.Text()))
    op.add_column('figure', sa.Column('strength', sa.Text()))
    op.add_column('figure', sa.Column('toughness', sa.Text()))
    op.add_column('figure', sa.Column('wounds', sa.Text()))
    op.add_column('figure', sa.Column('attacks', sa.Text()))
    op.add_column('figure', sa.Column('leadership', sa.Text()))
    op.add_column('figure', sa.Column('save', sa.Text()))
    op.add_column('figure', sa.Column('max_number', sa.Text()))
    op.drop_constraint('rosterentry_figureprofile_id_fkey', 'rosterentry')
    op.drop_column('rosterentry', 'figureprofile_id')
    op.drop_table('figureprofile_ability_secondary')
    op.drop_table('figureprofile')


    

