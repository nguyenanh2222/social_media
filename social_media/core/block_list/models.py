from datetime import datetime
from importlib.resources import _

from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models

import manage


class BlockListModel(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    users_id = models.IntegerField(db_column='users_id', blank=False)
    participants_id = models.IntegerField(db_column='participants_id', blank=False)
    created_at = models.DateTimeField(db_column='created_at', default=datetime.now, blank=True, editable=False)

    class Meta:
        db_table = 'BLOCK_LIST'
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
