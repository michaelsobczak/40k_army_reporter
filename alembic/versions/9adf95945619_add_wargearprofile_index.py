"""add wargearprofile index

Revision ID: 9adf95945619
Revises: 1f3810afc238
Create Date: 2019-12-21 11:29:11.609460

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = '9adf95945619'
down_revision = '1f3810afc238'
branch_labels = None
depends_on = None



def upgrade():
    op.create_index('wargearprofile_id', 'wargearprofile', ['id'], unique=True)

def downgrade():
    op.drop_index('wargearprofile_id', table_name='wargearprofile')
