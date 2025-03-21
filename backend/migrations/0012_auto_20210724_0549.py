# Generated by Django 2.2.8 on 2021-07-24 05:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('backend', '0011_product_product_color_default'),
    ]

    operations = [
        migrations.AlterField(
            model_name='letteringitemvariation',
            name='product_variation',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='lettering_item_variation_set', to='backend.ProductVariation'),
        ),
    ]
