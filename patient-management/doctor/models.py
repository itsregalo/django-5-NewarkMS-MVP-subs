from django.db import models
from django.utils.text import slugify

# Create your models here.

class Doctor(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    specialization = models.CharField(max_length=100)
    contact_number = models.CharField(max_length=15)
    email = models.EmailField(max_length=50)
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['first_name']
        db_table = 'doctor'

    def __str__(self):
        return self.first_name + ' ' + self.last_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.first_name + '-' + self.last_name)
        super(Doctor, self).save(*args, **kwargs)
