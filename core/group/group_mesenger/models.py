from datetime import datetime
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models
import manage


class GroupMessengerModel(models.Model):
    MESSENGER_TYPE = (
        ('T', 'text'),
        ('I', 'image'),
        ('V', 'video'),
        ('A', 'audio')
    )
    id = models.BigAutoField(db_column='id', primary_key=True)
    sourceId = models.CharField(db_column='sourceId', max_length=50, blank=True, default='hello')
    targetId = models.CharField(db_column='targetId', max_length=50, blank=True, default='hello')
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updatedAt = models.DateTimeField(db_column='updatedAt', default=datetime.now, blank=True, editable=False)
    messageType = models.CharField(db_column='messageType', blank=True, choices=MESSENGER_TYPE, max_length=10)
    message = models.CharField(db_column='message', max_length=50, blank=True, default='hello')

    class Meta:
        db_table = 'GROUP_MESSENGER'
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
