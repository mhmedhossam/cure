// dart

class NotificationsModel {
  bool? success;
  List<NotificationDetail>? notifications;

  NotificationsModel({this.success, this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['notifications'] != null) {
      notifications = <NotificationDetail>[];
      json['notifications'].forEach((v) {
        notifications!.add(NotificationDetail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['success'] = success;
    if (notifications != null) {
      data['notifications'] = notifications!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationDetail {
  String? id;
  String? title;
  String? body;
  bool? read;
  DateTime? createdAt;

  NotificationDetail({
    this.id,
    this.title,
    this.body,
    this.read,
    this.createdAt,
  });

  NotificationDetail.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    title = json['title'];
    body = json['body'];
    read =
        (json['read'] == true) ||
        (json['is_read'] == true) ||
        (json['status'] == 'read');
    createdAt = DateTime.tryParse(json['created_at']?.toString() ?? '');
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    data['read'] = read;
    data['created_at'] = createdAt?.toIso8601String();
    return data;
  }
}
