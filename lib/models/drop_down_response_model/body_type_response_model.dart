// To parse this JSON data, do
//
//     final bodyTypeResponseModel = bodyTypeResponseModelFromJson(jsonString);

import 'dart:convert';

BodyTypeResponseModel bodyTypeResponseModelFromJson(String str) => BodyTypeResponseModel.fromJson(json.decode(str));

String bodyTypeResponseModelToJson(BodyTypeResponseModel data) => json.encode(data.toJson());

class BodyTypeResponseModel {
  BodyTypeResponseModel({
    this.data,
  });

  List<BodyTypeData>? data;

  factory BodyTypeResponseModel.fromJson(Map<String, dynamic> json) => BodyTypeResponseModel(
    data: List<BodyTypeData>.from(json["data"].map((x) => BodyTypeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class BodyTypeData {
  BodyTypeData({
    this.id,
    this.btTitle,
    this.btStatus,
    this.btCreatedAt,
    this.btUpdatedAt,
    this.btDeleted,
    this.v,
  });

  String? id;
  String? btTitle;
  int? btStatus;
  DateTime? btCreatedAt;
  DateTime? btUpdatedAt;
  DateTime? btDeleted;
  int? v;

  factory BodyTypeData.fromJson(Map<String, dynamic> json) => BodyTypeData(
    id: json["_id"],
    btTitle: json["bt_title"],
    btStatus: json["bt_status"],
    btCreatedAt: DateTime.parse(json["bt_created_at"]),
    btUpdatedAt: DateTime.parse(json["bt_updated_at"]),
    btDeleted: json["bt_deleted"] == null ? null : DateTime.parse(json["bt_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "bt_title": btTitle,
    "bt_status": btStatus,
    "bt_created_at": btCreatedAt?.toIso8601String(),
    "bt_updated_at": btUpdatedAt?.toIso8601String(),
    "bt_deleted": btDeleted?.toIso8601String(),
    "__v": v,
  };
}
