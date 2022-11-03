from test.model import setup_test
from core.group.group_comment.models import GroupCommentModel
from core.group.group_member.models import GroupMemberModel

group_member = GroupMemberModel(
    id=1,
    groupId=1,
    userId=1,
    status=GroupMemberModel.STATUS.get(1),
    notes=GroupMemberModel.NOTES.get(1),
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z')

group_member.save()