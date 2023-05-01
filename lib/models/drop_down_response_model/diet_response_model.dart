// To parse this JSON data, do
//
//     final dietResponseModel = dietResponseModelFromJson(jsonString);

import 'dart:convert';

DietResponseModel dietResponseModelFromJson(String str) => DietResponseModel.fromJson(json.decode(str));

String dietResponseModelToJson(DietResponseModel data) => json.encode(data.toJson());

class DietResponseModel {
  DietResponseModel({
    this.data,
  });

  List<DietData>? data;

  factory DietResponseModel.fromJson(Map<String, dynamic> json) => DietResponseModel(
    data: List<DietData>.from(json["data"].map((x) => DietData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DietData {
  DietData({
    this.id,
    this.dTitle,
    this.dStatus,
    this.dCreatedAt,
    this.dUpdatedAt,
    this.dDeleted,
    this.v,
  });

  String? id;
  String? dTitle;
  int? dStatus;
  DateTime? dCreatedAt;
  DateTime? dUpdatedAt;
  dynamic dDeleted;
  int? v;

  factory DietData.fromJson(Map<String, dynamic> json) => DietData(
    id: json["_id"],
    dTitle: json["d_title"],
    dStatus: json["d_status"],
    dCreatedAt: DateTime.parse(json["d_created_at"]),
    dUpdatedAt: DateTime.parse(json["d_updated_at"]),
    dDeleted: json["d_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "d_title": dTitle,
    "d_status": dStatus,
    "d_created_at": dCreatedAt?.toIso8601String(),
    "d_updated_at": dUpdatedAt?.toIso8601String(),
    "d_deleted": dDeleted,
    "__v": v,
  };
}
