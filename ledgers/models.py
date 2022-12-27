from django.db import models
from django.conf import settings
# Create your models here.

class Ledgers(models.Model):
    CATEGORY_CHOICES = (
        ('수입', '수입'),
        ('금융', '금융'),
        ('공금', '공금'),
        ('교통', '교통'),
        ('생활비', '생활비'),
        ('육아', '육아'),
        ('외식', '외식'),
        ('이벤트', '이벤트'),
        ('경조비', '경조비'),
        ('자기계발', '자기계발'),
        ('여가', '여가'),
        ('의료', '의료'),
        ('업무', '업무'),
        ('비업무', '비업무'),
        ('기타', '기타')
    )
    user = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='ledger')
    categories = models.CharField(  # 관심 운동 선택
        max_length=10,
        choices=CATEGORY_CHOICES,
        default='수입',
    )
    title = models.CharField(max_length=80)
    content = models.TextField()
    paymoney = models.CharField(max_length=20)
    updated_at = models.DateTimeField(auto_now=True)
    paid_at = models.DateTimeField()