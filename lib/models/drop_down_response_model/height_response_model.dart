// To parse this JSON data, do
//
//     final heightResponseModel = heightResponseModelFromJson(jsonString);

import 'dart:convert';

HeightResponseModel heightResponseModelFromJson(String str) => HeightResponseModel.fromJson(json.decode(str));

String heightResponseModelToJson(HeightResponseModel data) => json.encode(data.toJson());

class HeightResponseModel {
  HeightResponseModel({
    this.data,
  });

  List<HeightData>? data;

  factory HeightResponseModel.fromJson(Map<String, dynamic> json) => HeightResponseModel(
    data: List<HeightData>.from(json["data"].map((x) => HeightData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class HeightData {
  HeightData({
    this.id,
    this.hTitle,
    this.hStatus,
    this.hCreatedAt,
    this.hUpdatedAt,
    this.hDeleted,
    this.v,
  });

  String? id;
  String? hTitle;
  int? hStatus;
  DateTime? hCreatedAt;
  DateTime? hUpdatedAt;
  dynamic hDeleted;
  int? v;

  factory HeightData.fromJson(Map<String, dynamic> json) => HeightData(
    id: json["_id"],
    hTitle: json["h_title"],
    hStatus: json["h_status"],
    hCreatedAt: DateTime.parse(json["h_created_at"]),
    hUpdatedAt: DateTime.parse(json["h_updated_at"]),
    hDeleted: json["h_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "h_title": hTitle,
    "h_status": hStatus,
    "h_created_at": hCreatedAt?.toIso8601String(),
    "h_updated_at": hUpdatedAt?.toIso8601String(),
    "h_deleted": hDeleted,
    "__v": v,
  };
}
