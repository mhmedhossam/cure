class DateModels {
  final String date;
  final String startTime;
  final String endTime;
  final String dayName;

  DateModels({
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.dayName,
  });

  factory DateModels.fromJson(Map<String, dynamic> json) {
    return DateModels(
      date: json['date'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      dayName: json['day_name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'start_time': startTime,
      'end_time': endTime,
      'day_name': dayName,
    };
  }
}