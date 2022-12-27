from django import forms
from .models import Ledgers

class LedgersForm(forms.ModelForm):
    class Meta:
        model = Ledgers
        fields = [
            'categories',
            'title',
            'content',
            'paymoney',
        ]
        labels = {
            'categories': '카테고리',
            'title': '제목',
            'content': '내용',
            'paymoney': '금액',
        }

class LedgersUpdateForm(forms.ModelForm):
    class Meta:
        model = Ledgers
        fields = [
            'content',
            'paymoney',
        ]
        labels = {
            'content': '내용',
            'paymoney': '금액',
        }