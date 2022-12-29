from django.shortcuts import render
# ShortenURL
from django.http import HttpResponseRedirect
from django.conf import settings
from .models import Url
from .serializers import UrlSerializer
from rest_framework.decorators import api_view
from rest_framework.response import Response
from datetime import datetime, timedelta
import random
import pytz

utc=pytz.UTC
# Create your views here.

@api_view(['POST'])
def shortener(request):
    try: # 기존 DB에 URL이 있을 경우
        url = Url.objects.get(link=request.data["link"])
        if url.expire < datetime.now():
            url.expire = datetime.now() + timedelta(days=7) # 만료일 연장
            url.save()
        serializer = UrlSerializer(url)
        return Response(serializer.data)
    except: # DB에 URL이 없을 경우
        data = {}
        data['link'] = request.data['link']
        data['expire'] = datetime.now() + timedelta(days=7) # 만료일 설정
        serializer = UrlSerializer(data=data)
        if serializer.is_valid(raise_exception=True):
            temp_url = convert()
            new_link = settings.SITE_URL + temp_url
            serializer.save(new_link = new_link)
            return Response(serializer.data)

def convert():
    # base-62 인코딩
    encoding = ['a', 'b', 'c', 'd', 'e', 'f', 'g',
                'h', 'i', 'j', 'k', 'l', 'm', 'n',
                'o', 'p', 'q', 'r', 's', 't', 'u',
                'v', 'w', 'x', 'y', 'z',
                'A', 'B', 'C', 'D', 'E', 'F', 'G',
                'H', 'I', 'J', 'K', 'L', 'M', 'N',
                'O', 'P', 'Q', 'R', 'S', 'T', 'U',
                'V', 'W', 'X', 'Y', 'Z',
                '0', '1', '2', '3', '4', '5', '6',
                '7', '8', '9',
                ]
    while True:
        new_url = ''.join(random.sample(encoding,8))
        try:
            url = Url.objects.get(new_link=new_url) # 단축 URL (62**8개)
        except:
            return new_url