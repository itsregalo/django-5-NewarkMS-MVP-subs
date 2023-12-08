from django.db import models
import uuid

# Create your models here.


class Surgery(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    surgery_name = models.CharField(max_length=255)
    surgery_date = models.DateField()
    surgery_time = models.TimeField()
    surgeon = models.ForeignKey('Doctor', on_delete=models.CASCADE)
    room = models.ForeignKey('Room', on_delete=models.CASCADE)
    patient = models.ForeignKey('Patient', on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'surgery'

    def __str__(self):
        return self.surgery_name
    

class SurgeryRoom(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    room = models.ForeignKey('Room', on_delete=models.CASCADE)
    surgery = models.ForeignKey('Surgery', on_delete=models.CASCADE)
    is_occupied = models.BooleanField(default=False)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'surgery_room'

    def __str__(self):
        return self.room.room_number
    
class SurgeryBooking(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    surgery = models.ForeignKey('Surgery', on_delete=models.CASCADE)
    patient = models.ForeignKey('Patient', on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'surgery_booking'

    def __str__(self):
        return self.surgery.surgery_name