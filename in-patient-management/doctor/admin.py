from django.contrib import admin
from .models import Doctor

@admin.register(Doctor)
class DoctorAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'specialization', 'timestamp', 'updated')
    search_fields = ['first_name', 'last_name', 'specialization']
