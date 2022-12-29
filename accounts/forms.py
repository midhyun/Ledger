from django import forms
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm, UsernameField
from django.contrib.auth import get_user_model
from .models import User

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()
        fields = [
            'email',
            'password1',
            'password2',
        ]
        labels = {
            'email': '이메일',
            'password1': '비밀번호',
            'password2': '비밀번호확인',
        }