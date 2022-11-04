from rest_framework import serializers
from core.user.models import UserModel


class UserSerializerCustom(serializers.Serializer):

    id = serializers.IntegerField()


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserModel
        fields = '__all__'

    def create(self, validated_data):
        return UserModel(**validated_data)

    #
    def update(self, instance, validated_data):
        instance.email = validated_data.get('email', instance.email)
        return instance
