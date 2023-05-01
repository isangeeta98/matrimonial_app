// To parse this JSON data, do
//
//     final educationResponseModel = educationResponseModelFromJson(jsonString);

import 'dart:convert';

EducationResponseModel educationResponseModelFromJson(String str) => EducationResponseModel.fromJson(json.decode(str));

String educationResponseModelToJson(EducationResponseModel data) => json.encode(data.toJson());

class EducationResponseModel {
  EducationResponseModel({
    this.data,
  });

  List<EducationData>? data;

  factory EducationResponseModel.fromJson(Map<String, dynamic> json) => EducationResponseModel(
    data: List<EducationData>.from(json["data"].map((x) => EducationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class EducationData {
  EducationData({
    this.id,
    this.esTitle,
    this.esStatus,
    this.esCreatedAt,
    this.esUpdatedAt,
    this.esDeleted,
    this.v,
  });

  String? id;
  String? esTitle;
  int? esStatus;
  DateTime? esCreatedAt;
  DateTime? esUpdatedAt;
  dynamic esDeleted;
  int? v;

  factory EducationData.fromJson(Map<String, dynamic> json) => EducationData(
    id: json["_id"],
    esTitle: json["es_title"],
    esStatus: json["es_status"],
    esCreatedAt: DateTime.parse(json["es_created_at"]),
    esUpdatedAt: DateTime.parse(json["es_updated_at"]),
    esDeleted: json["es_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "es_title": esTitle,
    "es_status": esStatus,
    "es_created_at": esCreatedAt?.toIso8601String(),
    "es_updated_at": esUpdatedAt?.toIso8601String(),
    "es_deleted": esDeleted,
    "__v": v,
  };
}
