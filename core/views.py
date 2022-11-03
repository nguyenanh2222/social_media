from rest_framework import viewsets
from tutorial.quickstart.serializers import UserSerializer

from social_media.core.user_model.models import USER


class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    # queryset = User.objects.all()
    # serializer_class = UserSerializer
    ...
