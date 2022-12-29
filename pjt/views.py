from django.shortcuts import render, redirect, get_object_or_404
# 단축 URL
from django.conf import settings
from django.http import HttpResponseRedirect
from shortener.models import Url
from datetime import datetime
from django.contrib import messages
import pytz

utc=pytz.UTC

def main(request):
    return render(request, 'main.html')

def original(request, new_url):
    new_link = settings.SITE_URL + new_url
    url = Url.objects.get(new_link=new_link)
    if url.expire < datetime.now():
        messages.warning(request, '만료된 URL입니다.')
        return redirect('main')
    return HttpResponseRedirect(url.link)