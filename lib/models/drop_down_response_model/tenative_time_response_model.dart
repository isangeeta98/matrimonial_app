// To parse this JSON data, do
//
//     final tenativeTimeResModel = tenativeTimeResModelFromJson(jsonString);

import 'dart:convert';

TenativeTimeResModel tenativeTimeResModelFromJson(String str) => TenativeTimeResModel.fromJson(json.decode(str));

String tenativeTimeResModelToJson(TenativeTimeResModel data) => json.encode(data.toJson());

class TenativeTimeResModel {
  TenativeTimeResModel({
    this.data,
  });

  List<TenativeTimeData>? data;

  factory TenativeTimeResModel.fromJson(Map<String, dynamic> json) => TenativeTimeResModel(
    data: List<TenativeTimeData>.from(json["data"].map((x) => TenativeTimeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class TenativeTimeData {
  TenativeTimeData({
    this.id,
    this.tiTitle,
    this.tiStatus,
    this.tiCreatedAt,
    this.tiUpdatedAt,
    this.tiDeleted,
    this.v,
  });

  String? id;
  String? tiTitle;
  int? tiStatus;
  DateTime? tiCreatedAt;
  DateTime? tiUpdatedAt;
  dynamic tiDeleted;
  int? v;

  factory TenativeTimeData.fromJson(Map<String, dynamic> json) => TenativeTimeData(
    id: json["_id"],
    tiTitle: json["ti_title"],
    tiStatus: json["ti_status"],
    tiCreatedAt: DateTime.parse(json["ti_created_at"]),
    tiUpdatedAt: DateTime.parse(json["ti_updated_at"]),
    tiDeleted: json["ti_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ti_title": tiTitle,
    "ti_status": tiStatus,
    "ti_created_at": tiCreatedAt?.toIso8601String(),
    "ti_updated_at": tiUpdatedAt?.toIso8601String(),
    "ti_deleted": tiDeleted,
    "__v": v,
  };
}
