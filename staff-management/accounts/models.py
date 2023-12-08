from django.db import models
from django.utils.text import slugify

from django.contrib.auth.models import AbstractUser

# Create your models here.
class User(AbstractUser):
    is_staff = models.BooleanField(default=False)

    class Meta:
        ordering = ['first_name']
        db_table = 'user'

    def __str__(self):
        return self.first_name + ' ' + self.last_name
    