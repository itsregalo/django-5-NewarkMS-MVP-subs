
from django.contrib import admin
from .models import Diagnosis, Appointment, Schedule, Prescription

class DiagnosisAdmin(admin.ModelAdmin):
    list_display = ('patient', 'diagnosis_date', 'doctor')
    list_filter = ('diagnosis_date', 'doctor')
    search_fields = ('patient__first_name', 'patient__last_name', 'doctor__first_name', 'doctor__last_name')

admin.site.register(Diagnosis, DiagnosisAdmin)


class AppointmentAdmin(admin.ModelAdmin):
    list_display = ('patient', 'appointment_date', 'doctor')
    list_filter = ('appointment_date', 'doctor')
    search_fields = ('patient__first_name', 'patient__last_name', 'doctor__first_name', 'doctor__last_name')

admin.site.register(Appointment, AppointmentAdmin)


class ScheduleAdmin(admin.ModelAdmin):
    list_display = ('doctor', 'date')
    list_filter = ('date', 'doctor')
    search_fields = ('doctor__first_name', 'doctor__last_name')

admin.site.register(Schedule, ScheduleAdmin)


class PrescriptionAdmin(admin.ModelAdmin):
    list_display = ('patient', 'prescription_date', 'doctor')
    list_filter = ('prescription_date', 'doctor')
    search_fields = ('patient__first_name', 'patient__last_name', 'doctor__first_name', 'doctor__last_name')

admin.site.register(Prescription, PrescriptionAdmin)

