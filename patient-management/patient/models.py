from django.db import models
from django.utils.text import slugify


# Create your models here.
class Patient(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    contact_number = models.CharField(max_length=15)
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['first_name']
        db_table = 'patient'

    def __str__(self):
        return self.first_name + ' ' + self.last_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.first_name + '-' + self.last_name)
        super(Patient, self).save(*args, **kwargs)
