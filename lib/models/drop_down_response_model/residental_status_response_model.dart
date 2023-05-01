// To parse this JSON data, do
//
//     final residentalStatusResponseModel = residentalStatusResponseModelFromJson(jsonString);

import 'dart:convert';

ResidentalStatusResponseModel residentalStatusResponseModelFromJson(String str) => ResidentalStatusResponseModel.fromJson(json.decode(str));

String residentalStatusResponseModelToJson(ResidentalStatusResponseModel data) => json.encode(data.toJson());

class ResidentalStatusResponseModel {
  ResidentalStatusResponseModel({
    this.data,
  });

  List<ResidentalStatusData>? data;

  factory ResidentalStatusResponseModel.fromJson(Map<String, dynamic> json) => ResidentalStatusResponseModel(
    data: List<ResidentalStatusData>.from(json["data"].map((x) => ResidentalStatusData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class ResidentalStatusData {
  ResidentalStatusData({
    this.id,
    this.rsTitle,
    this.rsStatus,
    this.rsCreatedAt,
    this.rsUpdatedAt,
    //this.rsDeleted,
    this.v,
  });

  String? id;
  String? rsTitle;
  int? rsStatus;
  DateTime? rsCreatedAt;
  DateTime? rsUpdatedAt;
  //DateTime? rsDeleted;
  int? v;

  factory ResidentalStatusData.fromJson(Map<String, dynamic> json) => ResidentalStatusData(
    id: json["_id"],
    rsTitle: json["rs_title"],
    rsStatus: json["rs_status"],
    rsCreatedAt: DateTime.parse(json["rs_created_at"]),
    rsUpdatedAt: DateTime.parse(json["rs_updated_at"]),
    //rsDeleted: DateTime.parse(json["rs_deleted"]) == null ? null : json["rs_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "rs_title": rsTitle,
    "rs_status": rsStatus,
    "rs_created_at": rsCreatedAt?.toIso8601String(),
    "rs_updated_at": rsUpdatedAt?.toIso8601String(),
    //"rs_deleted": rsDeleted?.toIso8601String(),
    "__v": v,
  };
}
