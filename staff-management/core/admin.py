from django.contrib import admin
from .models import StaffCategory, Staff, Shift, StaffShift

# Register your models here.
@admin.register(StaffCategory)
class StaffCategoryAdmin(admin.ModelAdmin):
    list_display = ('category', 'slug')
    prepopulated_fields = {'slug': ('category',)}

@admin.register(Staff)
class StaffAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'last_name', 'category', 'slug', 'email', 'phone', 'address', 'date_of_birth', 'date_joined', 'date_left', 'is_active', 'date_created', 'date_updated')
    list_filter = ('first_name', 'last_name', 'category', 'slug', 'email', 'phone', 'address', 'date_of_birth', 'date_joined', 'date_left', 'is_active', 'date_created', 'date_updated')
    prepopulated_fields = {'slug': ('first_name', 'last_name')}

@admin.register(Shift)
class ShiftAdmin(admin.ModelAdmin):
    list_display = ('name', 'start_time', 'end_time', 'slug')
    list_filter = ('name', 'start_time', 'end_time', 'slug')
    prepopulated_fields = {'slug': ('name',)}

@admin.register(StaffShift)
class StaffShiftAdmin(admin.ModelAdmin):
    list_display = ('staff', 'shift', 'date_created', 'date_updated')
    list_filter = ('staff', 'shift', 'date_created', 'date_updated')