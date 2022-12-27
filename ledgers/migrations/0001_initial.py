# Generated by Django 3.2.13 on 2022-12-27 08:59

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Ledgers',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('categories', models.CharField(choices=[('수입', '수입'), ('금융', '금융'), ('공금', '공금'), ('교통', '교통'), ('생활비', '생활비'), ('육아', '육아'), ('외식', '외식'), ('이벤트', '이벤트'), ('경조비', '경조비'), ('자기계발', '자기계발'), ('여가', '여가'), ('의료', '의료'), ('업무', '업무'), ('비업무', '비업무'), ('기타', '기타')], default='수입', max_length=10)),
                ('title', models.CharField(max_length=80)),
                ('content', models.TextField()),
                ('paymoney', models.CharField(max_length=20)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('paid_at', models.DateTimeField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='ledger', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
