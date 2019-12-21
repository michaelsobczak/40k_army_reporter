"""add wargear index

Revision ID: 1f3810afc238
Revises: 97c47b45726a
Create Date: 2019-12-21 11:22:50.597075

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '1f3810afc238'
down_revision = '97c47b45726a'
branch_labels = None
depends_on = None


def upgrade():
    op.create_index('wargear_id', 'wargear', ['id'], unique=True)

def downgrade():
    op.drop_index('wargear_id', table_name='wargear')