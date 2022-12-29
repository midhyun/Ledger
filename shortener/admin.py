from django.contrib import admin
from .models import Url
# Register your models here.

class UrlAdmin(admin.ModelAdmin):
    fields = ['link', 'new_link', 'expire']

admin.site.register(Url, UrlAdmin)