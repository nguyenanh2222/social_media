from django.contrib import admin
from django.urls import path, include, re_path
from api.base.jwt import TokenObtainPairView, TokenRefreshView
from rest_framework import permissions
from drf_yasg.views import get_schema_view
from drf_yasg import openapi

...

schema_view = get_schema_view(
   openapi.Info(
      title="Social Media API",
      default_version='v1',
      description="Social Media API",
      contact=openapi.Contact(email="sanghh111@gmail.com"),
      license=openapi.License(name="VIETANH"),
   ),
   public=True,
   permission_classes=[permissions.AllowAny],
)
urlpatterns = [
    # path('admin/', admin.site.urls),
    path('api/', include("api.urls")),
    path('login/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    re_path(r'^swagger(?P<format>\.json|\.yaml)$', schema_view.without_ui(cache_timeout=0), name='schema-json'),
    re_path(r'', schema_view.with_ui('swagger', cache_timeout=0), name='schema-swagger-ui'),
    re_path(r'^redoc/$', schema_view.with_ui('redoc', cache_timeout=0), name='schema-redoc'),
    # path('refresh/token/', TokenRefreshView.as_view(), name='token_refresh'),
    # path('api/token/verify/', TokenVerifyView.as_view(), name='token_verify'),
]


