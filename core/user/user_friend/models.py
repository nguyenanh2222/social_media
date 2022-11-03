from datetime import datetime

from django.db import models

from core.user.models import UserModel


class UserFriendModel(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    sourceId = models.ForeignKey(UserModel, db_column='sourceId', on_delete=models.CASCADE, blank=False,
                                 related_name="source_id")
    targetId = models.ForeignKey(UserModel, db_column='targetId', on_delete=models.CASCADE, blank=False,
                                 related_name="target_id")
    type = models.IntegerField(db_column="type", default=0)
    status = models.IntegerField(db_column="status", default=0)
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updateAt = models.DateTimeField(db_column='updateAt', default=datetime.now, blank=True, editable=False)
    notes = models.TextField(db_column="notes")

    class Meta:
        db_table = 'USER_FRIEND'
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
