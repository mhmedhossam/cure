import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/Doctor.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/data/Models/Patient.dart';

class BookingModels {
  int? id;
  Doctor? doctor;
  Patient? patient;
  String? appointmentDate;
  String? appointmentTime;
  String? status;
  double? price;
  String? paymentMethod;
  String? paymentStatus;
  String? notes;
  String? cancellationReason;
  String? cancelledAt;
  DateTime? createdAt;

  BookingModels({
    this.id,
    this.doctor,
    this.patient,
    this.appointmentDate,
    this.appointmentTime,
    this.status,
    this.price,
    this.paymentMethod,
    this.paymentStatus,
    this.notes,
    this.cancellationReason,
    this.cancelledAt,
    this.createdAt,
  });

  factory BookingModels.fromJson(dynamic json) {
    return BookingModels(
      id: json['id'] as int?,
      doctor: json['doctor'] == null
          ? null
          : Doctor.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : Patient.fromJson(json['patient'] as Map<String, dynamic>),
      appointmentDate: json['appointment_date'] as String?,
      appointmentTime: json['appointment_time'] as String?,
      status: json['status'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      paymentMethod: json['payment_method'] as String?,
      paymentStatus: json['payment_status'] as String?,
      notes: json['notes'] as String?,
      cancellationReason: json['cancellation_reason'] as String?,
      cancelledAt: json['cancelled_at'] as String?,
      createdAt: json['created_at'] == null 
          ? null 
          : DateTime.parse(json['created_at'] as String),
    );
  }

  dynamic toJson() => {
    'id': id,
    'doctor': doctor?.toJson(),
    'patient': patient?.toJson(),
    'appointment_date': appointmentDate,
    'appointment_time': appointmentTime,
    'status': status,
    'price': price,
    'payment_method': paymentMethod,
    'payment_status': paymentStatus,
    'notes': notes,
    'cancellation_reason': cancellationReason,
    'cancelled_at': cancelledAt,
    'created_at': createdAt?.toIso8601String(),
  };
}