# Hospital Management System Design

## 1. Overview

A hospital management system manages patients, doctors, appointments, medical records, prescriptions, billing, and hospital operations.

## 2. Functional Requirements

1. Patient registration.
2. Doctor registration and profiles.
3. Appointment scheduling.
4. Doctor availability management.
5. Electronic medical records.
6. Prescription management.
7. Laboratory test management.
8. Billing and payments.
9. Pharmacy inventory.
10. Notifications and reminders.

## 3. Non-Functional Requirements

- High availability.
- Strong privacy protection.
- Secure medical records.
- Reliable appointment scheduling.
- Data consistency.
- Auditability.
- Disaster recovery.

## 4. High-Level Architecture

Patients / Doctors / Staff
       |
   Load Balancer
       |
   API Gateway
       |
------------------------------------------------
| Authentication Service                       |
| Patient Service                              |
| Doctor Service                               |
| Appointment Service                          |
| Medical Records Service                      |
| Prescription Service                         |
| Laboratory Service                           |
| Billing Service                              |
| Pharmacy Service                             |
| Notification Service                         |
------------------------------------------------
       |
PostgreSQL / Redis / Object Storage / Kafka

## 5. Technology Stack

| Component | Technology |
|---|---|
| Frontend | React |
| Backend | Spring Boot |
| Database | PostgreSQL |
| Cache | Redis |
| File Storage | AWS S3 |
| Messaging | Kafka |
| Authentication | OAuth2 / JWT |
| Deployment | Docker + Kubernetes |

## 6. Database Design

### Patients
- patient_id (PK)
- name
- date_of_birth
- contact
- address

### Doctors
- doctor_id (PK)
- name
- specialization
- department

### Appointments
- appointment_id (PK)
- patient_id (FK)
- doctor_id (FK)
- appointment_time
- status

### MedicalRecords
- record_id (PK)
- patient_id (FK)
- doctor_id (FK)
- diagnosis
- notes
- created_at

### Prescriptions
- prescription_id (PK)
- patient_id (FK)
- doctor_id (FK)
- medication_details
- created_at

### Bills
- bill_id (PK)
- patient_id (FK)
- amount
- payment_status

## 7. Appointment Booking Flow

1. Patient searches for a doctor.
2. Appointment Service retrieves available slots.
3. Patient selects a slot.
4. System checks availability.
5. Appointment is created transactionally.
6. Doctor's schedule is updated.
7. Notification Service sends confirmation.

## 8. Preventing Double Booking

- Use database transactions.
- Apply unique constraints on doctor and appointment slot.
- Lock the relevant schedule record during booking.
- Revalidate availability before confirmation.

## 9. Medical Records Management

Medical records may include:

- Diagnosis.
- Prescriptions.
- Laboratory reports.
- Imaging reports.
- Treatment history.

Documents are stored in object storage, while metadata and references are maintained in PostgreSQL.

## 10. Security and Privacy

- Role-based access control.
- Encrypt sensitive medical information.
- Maintain audit logs.
- Restrict access to authorized healthcare professionals.
- Use secure authentication.
- Apply retention and deletion policies according to applicable regulations.

## 11. Redis Usage

Redis can cache:

- Doctor availability.
- Hospital department information.
- Frequently accessed appointment metadata.

Medical records should not rely on cache as their source of truth.

## 12. Kafka Usage

Events:

- PatientRegistered
- AppointmentBooked
- AppointmentCancelled
- LabReportGenerated
- PrescriptionCreated
- PaymentCompleted

## 13. Scaling Strategy

- Separate services by hospital domain.
- Use read replicas for medical history queries.
- Store large files in object storage.
- Use asynchronous notifications.
- Partition records by patient or hospital when required.

## 14. Failure Handling

### Appointment service unavailable
Provide a retry mechanism and avoid duplicate bookings.

### Notification service fails
Retry notification delivery independently.

### File storage unavailable
Preserve metadata and retry document uploads safely.

## 15. Important System Design Concepts

- Role-based access control
- Data privacy
- Database transactions
- Object storage
- Audit logging
- Event-driven architecture
- High availability

## 16. Conclusion

A hospital management system requires secure patient data handling, reliable scheduling, and accurate medical records.

Privacy, access control, and data consistency are its most important design considerations.
