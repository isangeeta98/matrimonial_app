// To parse this JSON data, do
//
//     final casteResponseModel = casteResponseModelFromJson(jsonString);

import 'dart:convert';

CasteResponseModel casteResponseModelFromJson(String str) => CasteResponseModel.fromJson(json.decode(str));

String casteResponseModelToJson(CasteResponseModel data) => json.encode(data.toJson());

class CasteResponseModel {
  CasteResponseModel({
    this.data,
  });

  List<CastData>? data;

  factory CasteResponseModel.fromJson(Map<String, dynamic> json) => CasteResponseModel(
    data: List<CastData>.from(json["data"].map((x) => CastData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CastData {
  CastData({
    this.id,
    this.cTitle,
    this.cReligion,
    this.cStatus,
    this.cCreatedAt,
    this.cUpdatedAt,
    this.cDeleted,
    this.v,
  });

  String? id;
  String? cTitle;
  String? cReligion;
  int? cStatus;
  DateTime? cCreatedAt;
  DateTime? cUpdatedAt;
  dynamic cDeleted;
  int? v;

  factory CastData.fromJson(Map<String, dynamic> json) => CastData(
    id: json["_id"],
    cTitle: json["c_title"],
    cReligion: json["c_religion"],
    cStatus: json["c_status"],
    cCreatedAt: DateTime.parse(json["c_created_at"]),
    cUpdatedAt: DateTime.parse(json["c_updated_at"]),
    cDeleted: json["c_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "c_title": cTitle,
    "c_religion": cReligion,
    "c_status": cStatus,
    "c_created_at": cCreatedAt?.toIso8601String(),
    "c_updated_at": cUpdatedAt?.toIso8601String(),
    "c_deleted": cDeleted,
    "__v": v,
  };
}
