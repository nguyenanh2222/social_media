import os
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.group.group_post.models import GroupPostModel

group_post = GroupPostModel(
    id=1,
    groupId=None,
    userId=1,
    postType=GroupPostModel.TYPE_POST.get('T'),
    caption='none',
    numberLike=12,
    commentId=1,
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
)
group_post.save()
