

from django.contrib import admin
from .models import Doctor

class DoctorAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'specialization', 'contact_number', 'email')
    list_filter = ('specialization',)
    search_fields = ('first_name', 'last_name', 'specialization')

admin.site.register(Doctor, DoctorAdmin)