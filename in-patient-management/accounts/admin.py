from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import User

# Register your models here.
@admin.register(User)
class UserAdmin(UserAdmin):
    list_display = ('username', 'first_name', 'last_name', 'is_patient', 'is_doctor', 'is_staff', 'is_superuser')
    list_filter = ('is_patient', 'is_doctor', 'is_staff', 'is_superuser')
    fieldsets = (
        (None, {'fields': ('username', 'password')}),
        ('Personal Information', {'fields': ('first_name', 'last_name', 'email', 'date_joined', 'last_login')}),
        ('Permissions', {'fields': ('is_patient', 'is_doctor', 'is_staff', 'is_superuser')}),
    )
    add_fieldsets = (
        (None, {'fields': ('username', 'password1', 'password2')}),
        ('Personal Information', {'fields': ('first_name', 'last_name', 'email')}),
        ('Permissions', {'fields': ('is_patient', 'is_doctor', 'is_staff', 'is_superuser')}),
    )
    search_fields = ('username', 'first_name', 'last_name')
    ordering = ('first_name',)
    filter_horizontal = ()