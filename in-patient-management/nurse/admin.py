from django.contrib import admin
from .models import Nurse

# Register your models here.
@admin.register(Nurse)
class NurseAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'specialization', 'updated')
    search_fields = ['first_name', 'last_name', 'specialization']
    list_filter = ['timestamp', 'updated']