import os
from datetime import datetime, date
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.attachement.models import AttachementModel

# AUTH_USER_MODEL = "core.UserModel"
attachement = AttachementModel(
    id=1,
    messagesUserId=1,
    fileUrl='https:k/#@sangnt84',
    thumbUrl='https:k/#@sangnt84',
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
    messengesGroupId=None,
)
attachement.save()
