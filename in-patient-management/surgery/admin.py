from django.contrib import admin
from .models import Surgery, SurgeryRoom, SurgeryBooking

@admin.register(Surgery)
class SurgeryAdmin(admin.ModelAdmin):
    list_display = ('surgery_name', 'surgery_date', 'surgery_time', 'surgeon', 'room', 'patient', 'timestamp', 'updated')
    search_fields = ['surgery_name', 'surgeon__first_name', 'surgeon__last_name', 'room__room_number', 'patient__first_name', 'patient__last_name']
    list_filter = ['surgery_date', 'surgeon', 'room', 'timestamp', 'updated']

@admin.register(SurgeryRoom)
class SurgeryRoomAdmin(admin.ModelAdmin):
    list_display = ('room', 'surgery', 'is_occupied', 'timestamp', 'updated')
    search_fields = ['room__room_number', 'surgery__surgery_name']
    list_filter = ['room', 'surgery', 'is_occupied', 'timestamp', 'updated']

@admin.register(SurgeryBooking)
class SurgeryBookingAdmin(admin.ModelAdmin):
    list_display = ('surgery', 'patient', 'timestamp', 'updated')
    search_fields = ['surgery__surgery_name', 'patient__first_name', 'patient__last_name']
    list_filter = ['surgery', 'patient', 'timestamp', 'updated']
