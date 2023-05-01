// To parse this JSON data, do
//
//     final editEducationResModel = editEducationResModelFromJson(jsonString);

import 'dart:convert';

EditEducationResModel editEducationResModelFromJson(String str) => EditEducationResModel.fromJson(json.decode(str));

String editEducationResModelToJson(EditEducationResModel data) => json.encode(data.toJson());

class EditEducationResModel {
  EditEducationResModel({
    this.status,
    this.message,
  });

  int? status;
  String? message;

  factory EditEducationResModel.fromJson(Map<String, dynamic> json) => EditEducationResModel(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}
