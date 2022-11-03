from datetime import datetime
from django.db import models
from core.group.models import GroupModel


class GroupFollowingModel(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    sourceId = models.ForeignKey(GroupModel, db_column='sourceId', on_delete=models.CASCADE, blank=False, related_name="source_id")
    targetId = models.ForeignKey(GroupModel,   db_column='targetId', on_delete=models.CASCADE, blank=False, related_name="target_id")
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)

    class Meta:
        db_table = 'GROUP_FOLLOWING'
        permissions = [
            ("change_post", "Can change the post"),
            ("delete_post", "Can delete the post"),
        ]

    # ex: user.has_perm('app.close_task')
    def get_user_permissions(self, obj=None):
        return super().get_user_permissions(obj)

    def get_group_permissions(self, obj=None):
        return super().get_group_permissions(obj)

    def get_all_permissions(self, obj=None):
        return super().get_all_permissions(obj)

    def has_perm(self, perm, obj=None):
        return super().has_perm(perm, obj)

    def has_perms(self, perm_list, obj=None):
        return super().has_perms(perm_list, obj)

    def has_module_perms(self, app_label):
        return super().has_module_perms(app_label)
