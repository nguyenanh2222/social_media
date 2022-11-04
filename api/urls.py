from django.urls import path, include

urlpatterns = [
    # path('users/', views.get_users),
    path('user/', include("api.user.urls")),

]
