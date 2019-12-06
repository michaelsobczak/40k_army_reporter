"""add figure wargear table

Revision ID: 72ab8114c375
Revises: 445de4e3108d
Create Date: 2019-12-06 14:25:29.265274

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '72ab8114c375'
down_revision = '445de4e3108d'
branch_labels = None
depends_on = None


def upgrade():
    op.create_table('figure_wargear_secondary',
    sa.Column('figure_id', sa.Integer(), nullable=True),
    sa.Column('wargear_id', sa.Integer(), nullable=True),
    sa.ForeignKeyConstraint(['figure_id'], ['figure.id'], ),
    sa.ForeignKeyConstraint(['wargear_id'], ['wargear.id'], )
    )


def downgrade():
    op.drop_table('figure_wargear_secondary')
