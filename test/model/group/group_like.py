from test.model import setup_test
from core.group.models import GroupModel
from core.group.group_comment.models import GroupCommentModel
from core.group.group_like.models import GroupLikeModel

commentId = GroupCommentModel.objects.get(id=1)
group_like = GroupLikeModel(
    id=1,
    groupId=1,
    userId=1,
    commentId=commentId,
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z')

group_like.save()