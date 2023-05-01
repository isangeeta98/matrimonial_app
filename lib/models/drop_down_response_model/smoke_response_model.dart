// To parse this JSON data, do
//
//     final smokeResponseModel = smokeResponseModelFromJson(jsonString);

import 'dart:convert';

SmokeResponseModel smokeResponseModelFromJson(String str) => SmokeResponseModel.fromJson(json.decode(str));

String smokeResponseModelToJson(SmokeResponseModel data) => json.encode(data.toJson());

class SmokeResponseModel {
  SmokeResponseModel({
    this.data,
  });

  List<SmokeData>? data;

  factory SmokeResponseModel.fromJson(Map<String, dynamic> json) => SmokeResponseModel(
    data: List<SmokeData>.from(json["data"].map((x) => SmokeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class SmokeData {
  SmokeData({
    this.id,
    this.sTitle,
    this.sStatus,
    this.sCreatedAt,
    this.sUpdatedAt,
    this.sDeleted,
    this.v,
  });

  String? id;
  String? sTitle;
  int? sStatus;
  DateTime? sCreatedAt;
  DateTime? sUpdatedAt;
  DateTime? sDeleted;
  int? v;

  factory SmokeData.fromJson(Map<String, dynamic> json) => SmokeData(
    id: json["_id"],
    sTitle: json["s_title"],
    sStatus: json["s_status"],
    sCreatedAt: DateTime.parse(json["s_created_at"]),
    sUpdatedAt: DateTime.parse(json["s_updated_at"]),
    sDeleted: json["s_deleted"] == null ? null : DateTime.parse(json["s_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "s_title": sTitle,
    "s_status": sStatus,
    "s_created_at": sCreatedAt?.toIso8601String(),
    "s_updated_at": sUpdatedAt?.toIso8601String(),
    "s_deleted": sDeleted?.toIso8601String(),
    "__v": v,
  };
}
