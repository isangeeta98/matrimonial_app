// To parse this JSON data, do
//
//     final occupationFieldResponseModel = occupationFieldResponseModelFromJson(jsonString);

import 'dart:convert';

OccupationFieldResponseModel occupationFieldResponseModelFromJson(String str) => OccupationFieldResponseModel.fromJson(json.decode(str));

String occupationFieldResponseModelToJson(OccupationFieldResponseModel data) => json.encode(data.toJson());

class OccupationFieldResponseModel {
  OccupationFieldResponseModel({
    this.data,
  });

  List<OccupationFieldData>? data;

  factory OccupationFieldResponseModel.fromJson(Map<String, dynamic> json) => OccupationFieldResponseModel(
    data: List<OccupationFieldData>.from(json["data"].map((x) => OccupationFieldData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OccupationFieldData {
  OccupationFieldData({
    this.id,
    this.ofTitle,
    this.ofStatus,
    this.ofCreatedAt,
    this.ofUpdatedAt,
    this.ofDeleted,
    this.v,
  });

  String? id;
  String? ofTitle;
  int? ofStatus;
  DateTime? ofCreatedAt;
  DateTime? ofUpdatedAt;
  dynamic ofDeleted;
  int? v;

  factory OccupationFieldData.fromJson(Map<String, dynamic> json) => OccupationFieldData(
    id: json["_id"],
    ofTitle: json["of_title"],
    ofStatus: json["of_status"],
    ofCreatedAt: DateTime.parse(json["of_created_at"]),
    ofUpdatedAt: DateTime.parse(json["of_updated_at"]),
    ofDeleted: json["of_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "of_title": ofTitle,
    "of_status": ofStatus,
    "of_created_at": ofCreatedAt?.toIso8601String(),
    "of_updated_at": ofUpdatedAt?.toIso8601String(),
    "of_deleted": ofDeleted,
    "__v": v,
  };
}
