from django.contrib import admin
from .models import Patient
# Register your models here.

@admin.register(Patient)
class PatientAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'date_of_birth', 'gender', 'admission_date', 'discharge_date', 'status', 'room', 'bed', 'nurse_assigned', 'timestamp', 'updated')
    search_fields = ['first_name', 'last_name', 'status']
    list_filter = ['gender', 'status', 'timestamp', 'updated']