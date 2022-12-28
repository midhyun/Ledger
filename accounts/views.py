from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, CustomAuthenticationForm
from django.contrib import messages
# JWT 인증관련
import requests
# Create your views here.

def signup(request):
    if request.user.is_authenticated:
        return redirect('main')
    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            auth_login(request, user)
            messages.success(request, '회원가입이 완료되었습니다.')
            return redirect('main')

    else:
        form = CustomUserCreationForm()
    context = {
        'form': form
    }
    return render(request, 'accounts/signup.html', context)

def login(request):
    if request.user.is_authenticated:
        return redirect('main')
    if request.method == 'POST':
        form = CustomAuthenticationForm(request, data=request.POST)
        if form.is_valid():
            auth_login(request, form.get_user())
            messages.success(request, '로그인 되었습니다.')
            return redirect((request.GET.get("next") or request.POST.get("next")) or "main")
        else:
            messages.warning(request, '아이디 또는 비밀번호를 잘못 입력했습니다.')
    else:
        form = CustomAuthenticationForm()
    context = {
        'form': form
    }
    return render(request, 'accounts/login.html', context)

@login_required
def logout(request):
    auth_logout(request)
    # 로그아웃 메시지
    messages.warning(request, '로그아웃 하였습니다.')
    return redirect("accounts:login")

# 임시 JWT 로그인 확인용
from rest_framework import viewsets
from rest_framework import serializers
from accounts.models import User
class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = "__all__"
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer