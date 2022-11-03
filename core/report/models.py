from datetime import datetime
from django.db import models
import manage


class ReportModel(models.Model):
    STATUS = (
        ("P",'pending'),
        ("R", 'resolved')
    )

    id = models.BigAutoField(db_column='id', primary_key=True)
    usersId = models.CharField(db_column='usersId', blank=True, max_length=26)
    participantsId = models.IntegerField(db_column='participantsId', blank=True, default='')
    reportType = models.TextField(db_column='reportType', blank=True, default='')
    notes = models.CharField(db_column='notes', blank=True, max_length=10)
    status = models.CharField(db_column='status', blank=True, default=None, choices=STATUS, max_length=20)
    groupId = models.IntegerField(db_column='groupId', blank=True)
    createdAt = models.DateTimeField(db_column='createdAt', default=datetime.now, blank=True, editable=False)

    class Meta:
        db_table = 'REPORT'
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
