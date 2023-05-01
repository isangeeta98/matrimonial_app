// To parse this JSON data, do
//
//     final drinkResponseModel = drinkResponseModelFromJson(jsonString);

import 'dart:convert';

DrinkResponseModel drinkResponseModelFromJson(String str) => DrinkResponseModel.fromJson(json.decode(str));

String drinkResponseModelToJson(DrinkResponseModel data) => json.encode(data.toJson());

class DrinkResponseModel {
  DrinkResponseModel({
    this.data,
  });

  List<DrinkData>? data;

  factory DrinkResponseModel.fromJson(Map<String, dynamic> json) => DrinkResponseModel(
    data: List<DrinkData>.from(json["data"].map((x) => DrinkData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class DrinkData {
  DrinkData({
    this.id,
    this.dTitle,
    this.dStatus,
    this.dCreatedAt,
    this.dUpdatedAt,
    this.dDeleted,
    this.v,
  });

  String? id;
  String? dTitle;
  int? dStatus;
  DateTime? dCreatedAt;
  DateTime? dUpdatedAt;
  dynamic dDeleted;
  int? v;

  factory DrinkData.fromJson(Map<String, dynamic> json) => DrinkData(
    id: json["_id"],
    dTitle: json["d_title"],
    dStatus: json["d_status"],
    dCreatedAt: DateTime.parse(json["d_created_at"]),
    dUpdatedAt: DateTime.parse(json["d_updated_at"]),
    dDeleted: json["d_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "d_title": dTitle,
    "d_status": dStatus,
    "d_created_at": dCreatedAt?.toIso8601String(),
    "d_updated_at": dUpdatedAt?.toIso8601String(),
    "d_deleted": dDeleted,
    "__v": v,
  };
}
