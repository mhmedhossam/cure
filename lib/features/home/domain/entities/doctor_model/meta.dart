class Meta {
  int? currentPage;
  int? lastPage;
  int? perPage;
  int? total;

  Meta({this.currentPage, this.lastPage, this.perPage, this.total});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json['current_page'] as int?,
    lastPage: json['last_page'] as int?,
    perPage: json['per_page'] as int?,
    total: json['total'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'last_page': lastPage,
    'per_page': perPage,
    'total': total,
  };
}
