from django.db import models
import uuid

# Create your models here.

class Patient(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    first_name = models.CharField(max_length=255)
    last_name = models.CharField(max_length=255)
    date_of_birth = models.DateField()
    gender = models.CharField(max_length=10)
    admission_date = models.DateField()
    discharge_date = models.DateField(null=True, blank=True)
    status = models.CharField(max_length=20, default='admitted')
    room = models.ForeignKey('Room', on_delete=models.CASCADE, null=True, blank=True)
    bed = models.ForeignKey('Bed', on_delete=models.CASCADE, null=True, blank=True)
    nurse_assigned = models.ForeignKey('Nurse', on_delete=models.CASCADE, null=True, blank=True)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'patient'

    def __str__(self):
        return self.first_name + ' ' + self.last_name
    
    def get_full_name(self):
        return self.first_name + ' ' + self.last_name
    
    def get_age(self):
        import datetime
        today = datetime.date.today()
        return today.year - self.date_of_birth.year - ((today.month, today.day) < (self.date_of_birth.month, self.date_of_birth.day))
    