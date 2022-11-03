from datetime import datetime
from django.db import models
from core.group.models import GroupModel


class UserCommentModel(models.Model):
    TYPE_COMMENT = (
        ('T', 'text'),
        ('I', 'image'),
        ('V', 'video'),
        ('A', 'audio')
    )
    id = models.BigAutoField(db_column='id', primary_key=True)
    postComment = models.CharField(db_column='postComment', blank=True, choices=TYPE_COMMENT, max_length=10)
    groupId = models.ForeignKey(GroupModel, on_delete=models.CASCADE)
    userId = models.IntegerField(db_column='userId', blank=True, default='')
    commentId = models.IntegerField(db_column='commentId', blank=True, default='hello')
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)
    updatedAt = models.DateTimeField(db_column='updatedAt', default=datetime.now, blank=True, editable=False)

    class Meta:
        db_table = 'USER_COMMENT'
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
