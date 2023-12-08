from django.db import models
import uuid

# Create your models here.
class Doctor(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    specialization = models.CharField(max_length=255)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'doctor'

    def __str__(self):
        return self.first_name + ' ' + self.last_name

