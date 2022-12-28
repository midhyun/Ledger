from django.urls import path, include
from . import views

app_name = "accounts"

urlpatterns = [
    path("session_signup/", views.signup, name="signup"),
    path("session_login/", views.login, name="login"),
    path("session_logout/", views.logout, name="logout"),
    path('registration/', include('dj_rest_auth.registration.urls')),
    path('', include('dj_rest_auth.urls')),
]