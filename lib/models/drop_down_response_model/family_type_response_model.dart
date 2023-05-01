// To parse this JSON data, do
//
//     final familyTypeResponseModel = familyTypeResponseModelFromJson(jsonString);

import 'dart:convert';

FamilyTypeResponseModel familyTypeResponseModelFromJson(String str) => FamilyTypeResponseModel.fromJson(json.decode(str));

String familyTypeResponseModelToJson(FamilyTypeResponseModel data) => json.encode(data.toJson());

class FamilyTypeResponseModel {
  FamilyTypeResponseModel({
    this.data,
  });

  List<FamilyTypeData>? data;

  factory FamilyTypeResponseModel.fromJson(Map<String, dynamic> json) => FamilyTypeResponseModel(
    data: List<FamilyTypeData>.from(json["data"].map((x) => FamilyTypeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FamilyTypeData {
  FamilyTypeData({
    this.id,
    this.ftTitle,
    this.ftStatus,
    this.ftCreatedAt,
    this.ftUpdatedAt,
    this.ftDeleted,
    this.v,
  });

  String? id;
  String? ftTitle;
  int? ftStatus;
  DateTime? ftCreatedAt;
  DateTime? ftUpdatedAt;
  DateTime? ftDeleted;
  int? v;

  factory FamilyTypeData.fromJson(Map<String, dynamic> json) => FamilyTypeData(
    id: json["_id"],
    ftTitle: json["ft_title"],
    ftStatus: json["ft_status"],
    ftCreatedAt: DateTime.parse(json["ft_created_at"]),
    ftUpdatedAt: DateTime.parse(json["ft_updated_at"]),
    ftDeleted: json["ft_deleted"] == null ? null : DateTime.parse(json["ft_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ft_title": ftTitle,
    "ft_status": ftStatus,
    "ft_created_at": ftCreatedAt?.toIso8601String(),
    "ft_updated_at": ftUpdatedAt?.toIso8601String(),
    "ft_deleted": ftDeleted?.toIso8601String(),
    "__v": v,
  };
}
