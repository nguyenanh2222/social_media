from datetime import datetime
from django.contrib.auth.base_user import AbstractBaseUser
from django.contrib.auth.models import PermissionsMixin
from django.db import models
import manage


class UserPostModel(models.Model):
    TYPE = (
        ("T", 'text'),
        ("I", 'image'),
        ("V", 'vedio'),
        ("A", 'audio')
    )
    id = models.BigAutoField(db_column='id', primary_key=True)
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updatedAt = models.DateTimeField(db_column='updatedAt', default=datetime.now, blank=True, editable=False)
    caption = models.TextField(db_column='caption', blank=True, default='')
    postType = models.CharField(db_column='postType', max_length=500, blank=True, default='', choices=TYPE)
    userId = models.IntegerField(db_column='userId', blank=True, default=1)
    numberLike = models.IntegerField(db_column='numberLike', blank=True, default=1)
    commentId = models.IntegerField(db_column='commentId', blank=True, default=1)

    class Meta:
        db_table = 'USER_POST'
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
