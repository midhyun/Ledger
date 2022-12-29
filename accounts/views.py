from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login as auth_login
from django.contrib.auth import logout as auth_logout
from django.contrib.auth import get_user_model
from django.contrib.auth.forms import AuthenticationForm
from django.contrib.auth.decorators import login_required
from django.http import JsonResponse
from http import HTTPStatus
from .forms import CustomUserCreationForm
from django.contrib import messages
# JWT 인증관련
import requests
import json
from datetime import timedelta
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

url = 'http://localhost:8000/accounts/dj_rest_auth/login/'
headers = {'Content-Type': "application/x-www-form-urlencoded"}


def login(request):
    result = {}
    if request.user.is_authenticated:
        return redirect('main')
    if request.method == 'POST':
        form = AuthenticationForm(request, data=request.POST)
        if form.is_valid():
            data = {
                "username": "",
                "email": request.POST['username'],
                "password": request.POST['password'],
            }
            res = requests.post(url, headers=headers, data=data).json()
            print(res)
            result['my-app-auth'] = res['access_token']
            result['my-refresh-token'] = res['refresh_token']
            result['user'] = res['user']['email']
            return JsonResponse(result, status=HTTPStatus.OK)
        # form = AuthenticationForm(request, data=request.POST)
        # if form.is_valid():
        #     auth_login(request, form.get_user())
        #     messages.success(request, '로그인 되었습니다.')
        #     return redirect((request.GET.get("next") or request.POST.get("next")) or "main")
        # else:
        #     messages.warning(request, '아이디 또는 비밀번호를 잘못 입력했습니다.')
    else:
        form = AuthenticationForm()
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
