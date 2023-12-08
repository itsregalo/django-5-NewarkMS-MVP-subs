from django.db import models
from patient.models import Patient
from doctor.models import Doctor
from django.utils.text import slugify

# Create your models here.
class Diagnosis(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    diagnosis_date = models.DateField()
    illness_description = models.TextField()
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    prescription = models.TextField()
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['-diagnosis_date']
        db_table = 'diagnosis'

    def __str__(self):
        return self.patient.first_name + ' ' + self.patient.last_name

class Appointment(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    appointment_date = models.DateTimeField()
    appointment_reason = models.TextField()
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['-appointment_date']
        db_table = 'appointment'

    def save(self, *args, **kwargs):
        self.slug = slugify(self.patient.first_name + '-' + self.patient.last_name + '-' + str(self.appointment_date))
        super(Appointment, self).save(*args, **kwargs)

    def __str__(self):
        return self.patient.first_name + ' ' + self.patient.last_name
    
    def save(self, *args, **kwargs):
        self.slug = slugify(self.patient.first_name + '-' + self.patient.last_name + '-' + str(self.appointment_date))
        super(Appointment, self).save(*args, **kwargs)

class Schedule(models.Model):
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    date = models.DateField()
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['-date']
        db_table = 'schedule'


    def save(self, *args, **kwargs):
        self.slug = slugify(self.doctor.first_name + '-' + self.doctor.last_name + '-' + str(self.date))
        super(Schedule, self).save(*args, **kwargs)

    def __str__(self):
        return self.doctor.first_name + ' ' + self.doctor.last_name
    

class Prescription(models.Model):
    patient = models.ForeignKey(Patient, on_delete=models.CASCADE)
    doctor = models.ForeignKey(Doctor, on_delete=models.CASCADE)
    prescription_date = models.DateField()
    prescription = models.TextField()
    slug = models.SlugField(max_length=100, unique=True, blank=True)

    class Meta:
        ordering = ['-prescription_date']
        db_table = 'prescription'

    def save(self, *args, **kwargs):
        self.slug = slugify(self.patient.first_name + '-' + self.patient.last_name + '-' + str(self.prescription_date))
        super(Prescription, self).save(*args, **kwargs)

    def __str__(self):
        return self.patient.first_name + ' ' + self.patient.last_name
    
