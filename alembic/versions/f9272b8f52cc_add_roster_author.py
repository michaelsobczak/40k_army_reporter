"""add roster author

Revision ID: f9272b8f52cc
Revises: efb7f2d88366
Create Date: 2019-12-21 16:16:49.956465

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'f9272b8f52cc'
down_revision = 'efb7f2d88366'
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('roster', sa.Column('user_id', sa.Integer(), nullable=True))
    op.create_foreign_key('roster_user_id_fkey', 'roster', 'user', ['user_id'], ['id'])


def downgrade():
    op.drop_constraint('roster_user_id_fkey', 'roster')
    op.drop_column('roster', 'user_id')
