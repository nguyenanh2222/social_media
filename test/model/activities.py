import os
from datetime import datetime, date
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.activities.models import ActivitiesModel

# AUTH_USER_MODEL = "core.UserModel"
activity = ActivitiesModel(
    id = 1,
    activityType='comment',
    activityID=1,
    title='hello world',
    detail='first commit',
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
)
# activity.save(using="master")


