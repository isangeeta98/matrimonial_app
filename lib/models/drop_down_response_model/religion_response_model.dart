// To parse this JSON data, do
//
//     final religionResponseModel = religionResponseModelFromJson(jsonString);

import 'dart:convert';

ReligionResponseModel religionResponseModelFromJson(String str) => ReligionResponseModel.fromJson(json.decode(str));

String religionResponseModelToJson(ReligionResponseModel data) => json.encode(data.toJson());

class ReligionResponseModel {
  ReligionResponseModel({
    this.data,
  });

  List<Datum>? data;

  factory ReligionResponseModel.fromJson(Map<String, dynamic> json) => ReligionResponseModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.rTitle,
    this.rStatus,
    this.rCreatedAt,
    this.rUpdatedAt,
    this.rDeleted,
    this.v,
  });

  String? id;
  String? rTitle;
  int? rStatus;
  DateTime? rCreatedAt;
  DateTime? rUpdatedAt;
  DateTime? rDeleted;
  int? v;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    rTitle: json["r_title"],
    rStatus: json["r_status"],
    rCreatedAt: DateTime.parse(json["r_created_at"]),
    rUpdatedAt: DateTime.parse(json["r_updated_at"]),
    rDeleted: json["r_deleted"] == null ? null : DateTime.parse(json["r_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "r_title": rTitle,
    "r_status": rStatus,
    "r_created_at": rCreatedAt?.toIso8601String(),
    "r_updated_at": rUpdatedAt?.toIso8601String(),
    "r_deleted": rDeleted?.toIso8601String(),
    "__v": v,
  };
}
