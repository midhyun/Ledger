# Generated by Django 3.2.13 on 2022-12-28 10:04

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('accounts', '0004_remove_user_is_admin'),
    ]

    operations = [
        migrations.RenameField(
            model_name='user',
            old_name='is_staff',
            new_name='is_admin',
        ),
    ]
