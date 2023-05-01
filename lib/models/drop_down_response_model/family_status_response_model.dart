// To parse this JSON data, do
//
//     final familyStatusResponseModel = familyStatusResponseModelFromJson(jsonString);

import 'dart:convert';

FamilyStatusResponseModel familyStatusResponseModelFromJson(String str) => FamilyStatusResponseModel.fromJson(json.decode(str));

String familyStatusResponseModelToJson(FamilyStatusResponseModel data) => json.encode(data.toJson());

class FamilyStatusResponseModel {
  FamilyStatusResponseModel({
    this.data,
  });

  List<FamilyStatusData>? data;

  factory FamilyStatusResponseModel.fromJson(Map<String, dynamic> json) => FamilyStatusResponseModel(
    data: List<FamilyStatusData>.from(json["data"].map((x) => FamilyStatusData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FamilyStatusData {
  FamilyStatusData({
    this.id,
    this.fsTitle,
    this.fsStatus,
    this.fsCreatedAt,
    this.fsUpdatedAt,
    this.fsDeleted,
    this.v,
  });

  String? id;
  String? fsTitle;
  int? fsStatus;
  DateTime? fsCreatedAt;
  DateTime? fsUpdatedAt;
  DateTime? fsDeleted;
  int? v;

  factory FamilyStatusData.fromJson(Map<String, dynamic> json) => FamilyStatusData(
    id: json["_id"],
    fsTitle: json["fs_title"],
    fsStatus: json["fs_status"],
    fsCreatedAt: DateTime.parse(json["fs_created_at"]),
    fsUpdatedAt: DateTime.parse(json["fs_updated_at"]),
    fsDeleted: json["fs_deleted"] == null ? null : DateTime.parse(json["fs_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fs_title": fsTitle,
    "fs_status": fsStatus,
    "fs_created_at": fsCreatedAt?.toIso8601String(),
    "fs_updated_at": fsUpdatedAt?.toIso8601String(),
    "fs_deleted": fsDeleted?.toIso8601String(),
    "__v": v,
  };
}
