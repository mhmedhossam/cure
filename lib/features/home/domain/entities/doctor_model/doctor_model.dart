import 'datum.dart';
import 'meta.dart';

class DoctorModel {
  bool? success;
  String? message;
  List<Datum>? data;
  Meta? meta;

  DoctorModel({this.success, this.message, this.data, this.meta});

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
    success: json['success'] as bool?,
    message: json['message'] as String?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
        .toList(),
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'success': success,
    'message': message,
    'data': data?.map((e) => e.toJson()).toList(),
    'meta': meta?.toJson(),
  };
}
