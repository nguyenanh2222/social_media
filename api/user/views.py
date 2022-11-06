from typing import List

from rest_framework.decorators import api_view, permission_classes, authentication_classes
from rest_framework.permissions import IsAuthenticated, IsAuthenticatedOrReadOnly, AllowAny
from rest_framework.response import Response

from api.base.api_view import SocialMediaViewSet
from api.base.authentication import BaseJSONWebTokenAuthentication, JSONWebTokenAuthentication
# from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from api.serializers.user.serializers import UserSerializer, UserSerializerCustom
from api.user.fake import FAKE_LIST_USER
from core.user.models import UserModel
from drf_yasg import openapi
from drf_yasg.utils import swagger_auto_schema


class UserView(SocialMediaViewSet):

    @swagger_auto_schema(
        manual_parameters=[],
        responses={200: openapi.Response('', UserSerializer, examples=FAKE_LIST_USER)})
    def list_user(self, request):
        print(request.user)
        user_info = UserModel.objects.all()
        user_serializer = UserSerializer(user_info, many=True)
        return Response(data=user_serializer.data)

# @api_view(['GET'])
# # @permission_classes([JSONWebTokenAuthentication])
# @authentication_classes([JSONWebTokenAuthentication])
# def get_user(request, id: int):
#     user_info = UserModel.objects.filter(id=id)
#     print(user_info)
#     user_serializer = UserSerializer(user_info, many=True)
#     return Response(data=user_serializer.data)
#
#
# @api_view(['POST'])
# @permission_classes([AllowAny])
# def post_user(request):
#     data = request.data
#     print(data)
#     user = UserSerializer(data)
#     # user.is_valid(raise_exception=True)
#     UserModel(**user.data)
#
#     # user_info = UserModel.objects.filter(id=id)
#     # if user_info == None:
#     #     user
#     #     user_serializer = UserSerializer(user_info, many=True)
#     return Response(data={"mess": "OK"},
#                     status=201)
