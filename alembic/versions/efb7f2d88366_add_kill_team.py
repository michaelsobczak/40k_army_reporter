"""add kill team

Revision ID: efb7f2d88366
Revises: 9adf95945619
Create Date: 2019-12-21 13:59:12.429984

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'efb7f2d88366'
down_revision = '9adf95945619'
branch_labels = None
depends_on = None


def upgrade():

    op.create_table('killteam',
        sa.Column('id', sa.Integer(), nullable=False),
        sa.Column('name', sa.Text()),
        sa.Column('notes', sa.Text()),
        sa.Column('roster_id', sa.Integer()),
        sa.ForeignKeyConstraint(['roster_id'], ['roster.id']),
        sa.PrimaryKeyConstraint('id'),
    )

    op.create_table('rosterentry_killteam_secondary',
        sa.Column('rosterentry_id', sa.Integer(), nullable=True),
        sa.Column('killteam_id', sa.Integer(), nullable=True),
        sa.ForeignKeyConstraint(['rosterentry_id'], ['rosterentry.id'], ),
        sa.ForeignKeyConstraint(['killteam_id'], ['killteam.id'], )
    )


def downgrade():
    op.drop_table('rosterentry_killteam_secondary')
    op.drop_table('killteam')
