from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated,  IsAuthenticatedOrReadOnly, AllowAny
from rest_framework.response import Response
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from api.serializers.user.serializers import UserSerializer
from core.user.models import UserModel


@api_view(['GET'])
# @permission_classes([JSONWebTokenAuthentication])
def get_users(request):
    data = request.data
    print(data)
    JSONWebTokenAuthentication.get_jwt_value()
    # user_serilizer = UserSerializer(**data)
    # user_serilizer.is_valid(raise_exception=True)
    user_info = UserModel.objects.all()
    user_serializer = UserSerializer(user_info, many=True)
    return Response(user_serializer)