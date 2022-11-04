from django.urls import path, include

from api.user.views import UserView


urlpatterns = [
    path('', UserView.as_view(
        {
            "get": "list_user"
        }
    ))

]