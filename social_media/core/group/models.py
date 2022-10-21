from datetime import datetime
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models
import manage


class GroupModel(models.Model):
    id = models.BigAutoField(db_column='id', primary_key=True)
    createdBy = models.CharField(db_column='createdBy', max_length=50, blank=True, default='hello')
    updatedBy = models.CharField(db_column='updatedBy', max_length=50, blank=True, default='hello')
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updatedAt = models.DateTimeField(db_column='updatedAt', default=datetime.now, blank=True, editable=False)
    content = models.TextField(db_column='content', max_length=500, blank=True, default='')
    profile = models.TextField(db_column='profile', max_length=500, blank=True, default='')
    title = models.CharField(db_column='title', max_length=75, blank=True, default='hello')
    noMember = models.IntegerField(db_column='noMember', blank=True, default=1)

    class Meta:
        db_table = 'GROUP',
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
