class BaseModel {
  dynamic data;
  String? message;
  bool? success;

  BaseModel({this.data, this.message, this.success});

  BaseModel.fromJson(Map<String, dynamic> json) {
    data = json["data"] as dynamic;
    message = json["message"] as String?;
    success = json["success"] as bool?;
  }

  Map<String, dynamic> toJson() {
    return {"data": data, "message": message, "success": success};
  }
}
