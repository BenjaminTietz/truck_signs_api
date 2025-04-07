# Generated by Django 2.2.8 on 2021-07-17 03:02

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0003_auto_20210630_0033'),
    ]

    operations = [
        migrations.CreateModel(
            name='Comment',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user_email', models.CharField(max_length=256)),
                ('image', models.ImageField(upload_to='uploads/comments/')),
                ('text', models.TextField(blank=True)),
                ('visible', models.BooleanField(default=False)),
            ],
        ),
    ]
