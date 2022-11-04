from rest_framework.viewsets import GenericViewSet

from api.base.authentication import JSONWebTokenAuthentication


class SocialMediaViewSet(GenericViewSet):
    authentication_classes = (JSONWebTokenAuthentication,)