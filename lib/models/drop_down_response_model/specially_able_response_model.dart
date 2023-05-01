// To parse this JSON data, do
//
//     final speciallyAbleResponseModel = speciallyAbleResponseModelFromJson(jsonString);

import 'dart:convert';

SpeciallyAbleResponseModel speciallyAbleResponseModelFromJson(String str) => SpeciallyAbleResponseModel.fromJson(json.decode(str));

String speciallyAbleResponseModelToJson(SpeciallyAbleResponseModel data) => json.encode(data.toJson());

class SpeciallyAbleResponseModel {
  SpeciallyAbleResponseModel({
    this.data,
  });

  List<SpecialyAbleData>? data;

  factory SpeciallyAbleResponseModel.fromJson(Map<String, dynamic> json) => SpeciallyAbleResponseModel(
    data: List<SpecialyAbleData>.from(json["data"].map((x) => SpecialyAbleData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SpecialyAbleData {
  SpecialyAbleData({
    this.id,
    this.saTitle,
    this.saStatus,
    this.saCreatedAt,
    this.saUpdatedAt,
    this.saDeleted,
    this.v,
  });

  String? id;
  String? saTitle;
  int? saStatus;
  DateTime? saCreatedAt;
  DateTime? saUpdatedAt;
  dynamic saDeleted;
  int? v;

  factory SpecialyAbleData.fromJson(Map<String, dynamic> json) => SpecialyAbleData(
    id: json["_id"],
    saTitle: json["sa_title"],
    saStatus: json["sa_status"],
    saCreatedAt: DateTime.parse(json["sa_created_at"]),
    saUpdatedAt: DateTime.parse(json["sa_updated_at"]),
    saDeleted: json["sa_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sa_title": saTitle,
    "sa_status": saStatus,
    "sa_created_at": saCreatedAt?.toIso8601String(),
    "sa_updated_at": saUpdatedAt?.toIso8601String(),
    "sa_deleted": saDeleted,
    "__v": v,
  };
}
