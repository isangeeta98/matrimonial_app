// To parse this JSON data, do
//
//     final educationSpecResponseModel = educationSpecResponseModelFromJson(jsonString);

import 'dart:convert';

EducationSpecResponseModel educationSpecResponseModelFromJson(String str) => EducationSpecResponseModel.fromJson(json.decode(str));

String educationSpecResponseModelToJson(EducationSpecResponseModel data) => json.encode(data.toJson());

class EducationSpecResponseModel {
  EducationSpecResponseModel({
    this.data,
  });

  List<EducationSpecData>? data;

  factory EducationSpecResponseModel.fromJson(Map<String, dynamic> json) => EducationSpecResponseModel(
    data: List<EducationSpecData>.from(json["data"].map((x) => EducationSpecData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EducationSpecData {
  EducationSpecData({
    this.id,
    this.efTitle,
    this.efEsTitle,
    this.efStatus,
    this.efCreatedAt,
    this.efUpdatedAt,
    this.efDeleted,
    this.v,
  });

  String? id;
  String? efTitle;
  String? efEsTitle;
  int? efStatus;
  DateTime? efCreatedAt;
  DateTime? efUpdatedAt;
  dynamic efDeleted;
  int? v;

  factory EducationSpecData.fromJson(Map<String, dynamic> json) => EducationSpecData(
    id: json["_id"],
    efTitle: json["ef_title"],
    efEsTitle: json["ef_es_title"],
    efStatus: json["ef_status"],
    efCreatedAt: DateTime.parse(json["ef_created_at"]),
    efUpdatedAt: DateTime.parse(json["ef_updated_at"]),
    efDeleted: json["ef_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ef_title": efTitle,
    "ef_es_title": efEsTitle,
    "ef_status": efStatus,
    "ef_created_at": efCreatedAt?.toIso8601String(),
    "ef_updated_at": efUpdatedAt?.toIso8601String(),
    "ef_deleted": efDeleted,
    "__v": v,
  };
}
