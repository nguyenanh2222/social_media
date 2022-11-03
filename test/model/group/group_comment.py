import os
import django

# from django.contrib.auth.models import User
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'social_media.settings')
django.setup()
from core.group.group_comment.models import GroupCommentModel

group_comment = GroupCommentModel(
    id=1,
    postComment=GroupCommentModel.TYPE_COMMENT.get('T'),
    groupId=1,
    userId=1,
    commentId=1,
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
)
group_comment.save()