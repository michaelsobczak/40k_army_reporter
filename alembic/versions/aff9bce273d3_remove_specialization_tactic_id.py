"""remove specialization tactic id

Revision ID: aff9bce273d3
Revises: 7725df8db534
Create Date: 2019-12-08 11:18:30.191509

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'aff9bce273d3'
down_revision = '7725df8db534'
branch_labels = None
depends_on = None


def upgrade():
    op.drop_constraint('specialization_tactic_id_fkey', 'specialization')
    op.drop_column('specialization', 'tactic_id')
    op.add_column('tactic', sa.Column('level', sa.Integer(), default=0))
    op.add_column('tactic', sa.Column('specialization_id', sa.Integer(), nullable=True))
    op.create_foreign_key('tactic_specialization_id_fkey', 'tactic', 'specialization', ['specialization_id'], ['id'])

def downgrade():
    op.drop_column('tactic', 'level')
    op.add_column('specialization', sa.Column('tactic_id', sa.Integer(), nullable=True))
    op.create_foreign_key(u'specialization_tactic_id_fkey', 'specialization', 'tactic', ['tactic_id'], ['id'])
    op.drop_constraint('tactic_specialization_id_fkey', 'tactic')
    op.drop_column('tactic', 'specialization_id')
