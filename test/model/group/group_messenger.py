from test.model import setup_test
from core.group.group_mesenger.models import GroupMessengerModel
from core.group.group_post.models import GroupPostModel

group_mess = GroupMessengerModel(
    id=1,
    sourceId=1,
    targetId=1,
    messageType=GroupMessengerModel.MESSENGER_TYPE.get('T'),
    message='none',
    createdAt='2016-03-09T03:30:25.1263499Z',
    updatedAt='2016-03-09T03:30:25.1263499Z',
)
group_mess.save()
