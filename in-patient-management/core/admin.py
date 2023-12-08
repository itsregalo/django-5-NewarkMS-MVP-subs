from django.contrib import admin
from .models import Room, Bed

@admin.register(Room)
class RoomAdmin(admin.ModelAdmin):
    list_display = ('room_number', 'room_type', 'timestamp', 'updated')
    search_fields = ['room_number', 'room_type']
    list_filter = ['timestamp', 'updated']

@admin.register(Bed)
class BedAdmin(admin.ModelAdmin):
    list_display = ('bed_number', 'bed_type', 'room', 'timestamp', 'updated')
    search_fields = ['bed_number', 'bed_type', 'room__room_number']
    list_filter = ['room', 'timestamp', 'updated']
