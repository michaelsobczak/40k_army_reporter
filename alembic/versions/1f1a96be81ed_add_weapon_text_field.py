"""add weapon text field

Revision ID: 1f1a96be81ed
Revises: 4394d533fc71
Create Date: 2019-12-08 16:23:28.841196

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1f1a96be81ed'
down_revision = '4394d533fc71'
branch_labels = None
depends_on = None


def upgrade():
    op.add_column('wargear', sa.Column('text', sa.Text(), nullable=True))

def downgrade():
    op.drop_column('wargear', 'text')
