"""update wargear to profiles

Revision ID: 4394d533fc71
Revises: aff9bce273d3
Create Date: 2019-12-08 13:53:38.744416

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '4394d533fc71'
down_revision = 'aff9bce273d3'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table('wargearprofile',
        sa.Column('id', sa.Integer(), nullable=False, primary_key=True),
        sa.Column('name', sa.Text(), nullable=True),
        sa.Column('wargear_id', sa.Integer(), nullable=True),
        sa.Column('wargear_range', sa.Text(), nullable=True),
        sa.Column('wargear_type', sa.Text(), nullable=True),
        sa.Column('strength', sa.Text(), nullable=True),
        sa.Column('ap', sa.Text(), nullable=True),
        sa.Column('damage', sa.Text(), nullable=True),
        sa.ForeignKeyConstraint(['wargear_id'], ['wargear.id'], ),
        sa.PrimaryKeyConstraint('id')
    )

    op.create_table('wargearprofile_ability_secondary',
        sa.Column('wargearprofile_id', sa.Integer(), nullable=True),
        sa.Column('ability_id', sa.Integer(), nullable=True),
        sa.ForeignKeyConstraint(['wargearprofile_id'], ['wargearprofile.id'], ),
        sa.ForeignKeyConstraint(['ability_id'], ['ability.id'], )
    )

    op.drop_column('wargear', 'wargear_range')
    op.drop_column('wargear', 'wargear_type')
    op.drop_column('wargear', 'strength')
    op.drop_column('wargear', 'ap')
    op.drop_column('wargear', 'damage')
    op.drop_column('wargear', 'profile')

    
def downgrade():
    op.drop_table('wargear_profile')
    op.add_column('wargear', sa.Column('wargear_range', sa.Text()))
    op.add_column('wargear', sa.Column('wargear_type', sa.Text()))
    op.add_column('wargear', sa.Column('strength', sa.Text()))
    op.add_column('wargear', sa.Column('ap', sa.Text()))
    op.add_column('wargear', sa.Column('damage', sa.Text()))
    op.add_column('wargear', sa.Column('profile', sa.Text()))
