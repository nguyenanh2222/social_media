from django.urls import path, include
from . import views
urlpatterns = [
    # path('users/', views.get_users),
    path('user/<id>', views.get_user),
]