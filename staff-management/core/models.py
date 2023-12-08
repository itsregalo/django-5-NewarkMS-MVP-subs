from django.db import models
from django.utils.text import slugify
import uuid


# Create your models here.

"""
Medical staff management
o Add/remove a stuff member
o View stuff member per job type
o Schedule job shift

"""

class StaffCategory(models.Model):
    category = models.CharField(max_length=50, unique=True)
    slug = models.SlugField(max_length=50, unique=True, blank=True)

    def __str__(self):
        return self.category
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.category)
        super(StaffCategory, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Staff Categories"
        db_table = "staff_category"


class Staff(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=50, unique=True)
    last_name = models.CharField(max_length=50, unique=True)
    category = models.ForeignKey(StaffCategory, on_delete=models.CASCADE)
    slug = models.SlugField(max_length=50, unique=True, blank=True)
    email = models.EmailField(max_length=50, unique=True)
    phone = models.CharField(max_length=50, unique=True)
    address = models.CharField(max_length=50, unique=True)
    date_of_birth = models.DateField()
    date_joined = models.DateField()
    date_left = models.DateField(blank=True, null=True)
    is_active = models.BooleanField(default=True)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.first_name + " " + self.last_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.first_name + " " + self.last_name)
        super(Staff, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Staff"
        db_table = "staff"


class Shift(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=50, unique=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    slug = models.SlugField(max_length=50, unique=True, blank=True)

    def __str__(self):
        return self.name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.name)
        super(Shift, self).save(*args, **kwargs)

    class Meta:
        verbose_name_plural = "Shifts"
        db_table = "shift"


class StaffShift(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    staff = models.ForeignKey(Staff, on_delete=models.CASCADE)
    shift = models.ForeignKey(Shift, on_delete=models.CASCADE)
    date_created = models.DateTimeField(auto_now_add=True)
    date_updated = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.staff.first_name + " " + self.staff.last_name + " - " + self.shift.name
    
    class Meta:
        verbose_name_plural = "Staff Shifts"
        db_table = "staff_shift"


