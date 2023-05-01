// To parse this JSON data, do
//
//     final familyValueResponseModel = familyValueResponseModelFromJson(jsonString);

import 'dart:convert';

FamilyValueResponseModel familyValueResponseModelFromJson(String str) => FamilyValueResponseModel.fromJson(json.decode(str));

String familyValueResponseModelToJson(FamilyValueResponseModel data) => json.encode(data.toJson());

class FamilyValueResponseModel {
  FamilyValueResponseModel({
    this.data,
  });

  List<FamilyValueData>? data;

  factory FamilyValueResponseModel.fromJson(Map<String, dynamic> json) => FamilyValueResponseModel(
    data: List<FamilyValueData>.from(json["data"].map((x) => FamilyValueData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FamilyValueData {
  FamilyValueData({
    this.id,
    this.fvTitle,
    this.fvStatus,
    this.fvCreatedAt,
    this.fvUpdatedAt,
    this.fvDeleted,
    this.v,
  });

  String? id;
  String? fvTitle;
  int? fvStatus;
  DateTime? fvCreatedAt;
  DateTime? fvUpdatedAt;
  DateTime? fvDeleted;
  int? v;

  factory FamilyValueData.fromJson(Map<String, dynamic> json) => FamilyValueData(
    id: json["_id"],
    fvTitle: json["fv_title"],
    fvStatus: json["fv_status"],
    fvCreatedAt: DateTime.parse(json["fv_created_at"]),
    fvUpdatedAt: DateTime.parse(json["fv_updated_at"]),
    fvDeleted: json["fv_deleted"] == null ? null : DateTime.parse(json["fv_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fv_title": fvTitle,
    "fv_status": fvStatus,
    "fv_created_at": fvCreatedAt?.toIso8601String(),
    "fv_updated_at": fvUpdatedAt?.toIso8601String(),
    "fv_deleted": fvDeleted?.toIso8601String(),
    "__v": v,
  };
}
