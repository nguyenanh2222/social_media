from datetime import datetime

from django.contrib.auth.base_user import AbstractBaseUser
from django.db import models


class UserModel(AbstractBaseUser):
    password = models.CharField(db_column='password', max_length=128)
    last_login = models.DateTimeField(db_column='last_login', blank=True, null=True)
    id = models.BigAutoField(db_column='id', primary_key=True)
    uuid = models.CharField(db_column='uuid', max_length=26, blank=False)
    firstName = models.CharField(db_column='firstName', max_length=50, blank=True, default='hello')
    lastName = models.CharField(db_column='lastName', max_length=50, blank=True, default='hello')
    username = models.CharField(db_column='username', max_length=50, blank=True, unique=True, default='')
    mobile = models.CharField(db_column='mobile', max_length=15, blank=True, unique=True, default='03347592754')
    email = models.EmailField(db_column='email', max_length=254, blank=True, unique=True, default='foo@example.com')
    passwordHash = models.CharField(db_column='passwordHash', max_length=32, blank=True, default='')
    registeredAt = models.DateTimeField(db_column='registeredAt', default=datetime.now, blank=True, editable=False)
    intro = models.TextField(db_column='intro', max_length=500, blank=True, default='')
    profile = models.TextField(db_column='profile', max_length=500, blank=True, default='')
    is_active = models.BooleanField(db_column='is_active', default=0, blank=True)
    is_reported = models.BooleanField(db_column='is_reported', default=0, blank=True)
    is_blocked = models.BooleanField(db_column='is_blocked', default=0, blank=True)
    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = []

    # objects = CustomUserManager()

    def __str__(self):
        return self.email

    class Meta:
        db_table = 'USER'
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
