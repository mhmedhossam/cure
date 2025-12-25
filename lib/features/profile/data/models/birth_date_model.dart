class BirthdateModel {
  final int? day;
  final int? month;
  final int? year;

  BirthdateModel({this.day, this.month, this.year});

  factory BirthdateModel.fromJson(Map<String, dynamic> json) {
    return BirthdateModel(
      day: json['Day'],
      month: json['Month'],
      year: json['Year'],
    );
  }
}
