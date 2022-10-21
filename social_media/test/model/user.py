import os
# from datetime import datetime, date
import django
from django.db.models import QuerySet

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.user.models import UserModel

AUTH_USER_MODEL = "core.UserModel"
user = UserModel(
    uuid='f806dfa6-0f32-48a2-8a78',
    firstName='asd',
    lastName='sas',
    username='nguyenanh2222',
    mobile='0334865104',
    email='nguyenvie2103@gmail.com',
    passwordHash='21432',
    registeredAt='2012-09-04 06:00:00.000000-08:00',
    intro='asf',
    profile='asd',
    is_active=0,
    is_reported=0,
    is_blocked=0,
    password='django pass',
    last_login='2012-09-04 06:00:00.000000-08:00'
)
# user.save()
# user.objects.get_list()

queries = UserModel.objects.all()
print(queries[0].firstName)
