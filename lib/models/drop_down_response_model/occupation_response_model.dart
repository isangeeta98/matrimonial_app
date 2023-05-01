// To parse this JSON data, do
//
//     final occupationResponseModel = occupationResponseModelFromJson(jsonString);

import 'dart:convert';

OccupationResponseModel occupationResponseModelFromJson(String str) => OccupationResponseModel.fromJson(json.decode(str));

String occupationResponseModelToJson(OccupationResponseModel data) => json.encode(data.toJson());

class OccupationResponseModel {
  OccupationResponseModel({
    this.data,
  });

  List<OccupationData>? data;

  factory OccupationResponseModel.fromJson(Map<String, dynamic> json) => OccupationResponseModel(
    data: List<OccupationData>.from(json["data"].map((x) => OccupationData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OccupationData {
  OccupationData({
    required this.id,
    required this.osTitle,
    required this.osStatus,
    required this.osCreatedAt,
    required this.osUpdatedAt,
    this.osDeleted,
    required this.v,
  });

  String id;
  String osTitle;
  int osStatus;
  DateTime osCreatedAt;
  DateTime osUpdatedAt;
  DateTime? osDeleted;
  int v;

  factory OccupationData.fromJson(Map<String, dynamic> json) => OccupationData(
    id: json["_id"],
    osTitle: json["os_title"],
    osStatus: json["os_status"],
    osCreatedAt: DateTime.parse(json["os_created_at"]),
    osUpdatedAt: DateTime.parse(json["os_updated_at"]),
    osDeleted: json["os_deleted"] == null ? null : DateTime.parse(json["os_deleted"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "os_title": osTitle,
    "os_status": osStatus,
    "os_created_at": osCreatedAt.toIso8601String(),
    "os_updated_at": osUpdatedAt.toIso8601String(),
    "os_deleted": osDeleted?.toIso8601String(),
    "__v": v,
  };
}
