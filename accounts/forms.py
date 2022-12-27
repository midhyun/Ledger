from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm, PasswordChangeForm
from django.contrib.auth import get_user_model
from .models import User

class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = get_user_model()
        fields = [
            'username',
            'password1',
            'password2',
        ]
        labels = {
            'username': '이메일',
            'password1': '비밀번호',
            'password2': '비밀번호확인',
        }