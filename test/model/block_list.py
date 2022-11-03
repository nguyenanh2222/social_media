import os
from datetime import datetime, date
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.block_list.models import BlockListModel

# AUTH_USER_MODEL = "core.UserModel"
block = BlockListModel(
    id=1,
    users_id=1,
    participants_id=1,
    created_at='2016-03-09T03:30:25.1263499Z',
)
block.save()
