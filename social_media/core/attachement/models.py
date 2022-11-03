from datetime import datetime
from importlib.resources import _

from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models

import manage


class AttachementModel(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    messagesUserId = models.CharField(db_column='messagesUserId', max_length=45, blank=False)
    fileUrl = models.CharField(db_column='fileUrl', max_length=100, blank=False)
    thumbUrl = models.CharField(db_column='thumbUrl', max_length=100, blank=False)
    messengesGroupId = models.CharField(db_column='messengesGroupId', max_length=45, blank=True, default='hello')
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updatedAt = models.DateTimeField(db_column='updatedAt', default=datetime.now, blank=True, editable=False)

    class Meta:
        db_table = 'ATTACHEMENT'
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
