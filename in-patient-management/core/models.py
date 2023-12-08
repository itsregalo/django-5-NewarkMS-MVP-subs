from django.db import models
import uuid

# Create your models here.
"""
In-patient management
o Check for available room/bed
o Assign/remove a patent to a room/bed
o Assign/remove a doctor to a patient
o Assign/remove a nurse to a patient
o View scheduled surgery per room and per day
o View scheduled surgery per surgeon and per day
o Book a surgery
o View scheduled surgery per patient
"""

# all the models are here


class Room(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    room_number = models.CharField(max_length=255)
    room_type = models.CharField(max_length=255)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'room'

    def __str__(self):
        return self.room_number
    

class Bed(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    bed_number = models.CharField(max_length=255)
    bed_type = models.CharField(max_length=255)
    room = models.ForeignKey('Room', on_delete=models.CASCADE)
    timestamp = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ['timestamp']
        db_table = 'bed'

    def __str__(self):
        return self.bed_number
    
    
    