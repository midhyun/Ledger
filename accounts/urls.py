from django.urls import path, include
from . import views

app_name = "accounts"

urlpatterns = [
    # 세션 회원
    path("form_signup/", views.signup, name="signup"),
    path("login/", views.login, name="login"),
    path("form_logout/", views.logout, name="logout"),
    # JWT 회원가입
    path('registration/', include('dj_rest_auth.registration.urls')),
    # django rest auth API
    path('dj_rest_auth/', include('dj_rest_auth.urls')),
]