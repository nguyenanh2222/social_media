from rest_framework import serializers
from core.user.models import UserModel


class UserSerializer(serializers.ModelSerializer):
    # uuid = serializers.CharField()
    # firstName = serializers.CharField()
    # lastName = serializers.CharField()
    # username = serializers.CharField()
    # mobile = serializers.CharField()
    # email = serializers.EmailField()
    # passwordHash = serializers.CharField()
    # registeredAt = serializers.DateTimeField()
    # lastLogin = serializers.DateTimeField()
    # intro = serializers.CharField()
    # profile = serializers.CharField()
    # is_active = serializers.BooleanField()
    # is_reported = serializers.BooleanField()
    # is_blocked = serializers.BooleanField()

    class Meta:
        model = UserModel
        fields = '__all__'
        # fields = ('id',
        #           'uuid',
        #           'firstName',
        #           'lastName',
        #           'username',
        #           'mobile',
        #           'email',
        #           'passwordHash',
        #           'registeredAt',
        #           'lastLogin',
        #           'intro',
        #           'profile',
        #           'is_active',
        #           'is_reported',
        #           'is_blocked')

    def create(self, validated_data):
        return UserModel(**validated_data)
    #
    def update(self, instance, validated_data):
        instance.email = validated_data.get('email', instance.email)
        return instance
