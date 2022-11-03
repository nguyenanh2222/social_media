from test.model import setup_test
from core.group.models import GroupModel
from core.group.group_following.models import GroupFollowingModel

group_id = GroupModel.objects.get(id=1)

group_following = GroupFollowingModel(id=1,
                                      sourceId=group_id,
                                      targetId=group_id,
                                      createdAt='2016-03-09T03:30:25.1263499Z')
group_following.save()
