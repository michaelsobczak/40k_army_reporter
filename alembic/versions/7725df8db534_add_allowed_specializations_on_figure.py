"""add allowed specializations on figure

Revision ID: 7725df8db534
Revises: 72ab8114c375
Create Date: 2019-12-06 15:21:27.664920

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '7725df8db534'
down_revision = '72ab8114c375'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table('figure_specialization_secondary',
    sa.Column('figure_id', sa.Integer(), nullable=True),
    sa.Column('specialization_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['figure_id'], ['figure.id'], ),
    sa.ForeignKeyConstraint(['specialization_id'], ['specialization.id'], )
    )


def downgrade():
    op.drop_table('figure_specialization_secondary')
