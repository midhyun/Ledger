from django.urls import path
from . import views

app_name = 'ledgers'

urlpatterns = [
    path('', views.index, name='index'),
    path('create', views.create, name='create'),
    path('<int:ledger_pk>/update', views.update, name='update'),
    path('<int:ledger_pk>/delete', views.delete, name='delete'),
    path('<int:ledger_pk>/detail', views.detail, name='detail'),
    # 가계부 복제
    path('<int:ledger_pk>/replica', views.replica, name='replica'),

]