import os
from datetime import datetime, date
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.group.models import GroupModel

group = GroupModel(
    id=1,
    createdBy='dalata',
    updatedBy='kalata',
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
    content='hihihi',
    profile='hahaha',
    title='title',
    noMember=10
)
group.save()
