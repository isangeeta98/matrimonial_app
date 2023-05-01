// To parse this JSON data, do
//
//     final getProfileImageResponseModel = getProfileImageResponseModelFromJson(jsonString);

import 'dart:convert';

GetProfileImageResponseModel getProfileImageResponseModelFromJson(String str) => GetProfileImageResponseModel.fromJson(json.decode(str));

String getProfileImageResponseModelToJson(GetProfileImageResponseModel data) => json.encode(data.toJson());

class GetProfileImageResponseModel {
  GetProfileImageResponseModel({
    this.record,
  });

  Record? record;

  factory GetProfileImageResponseModel.fromJson(Map<String, dynamic> json) => GetProfileImageResponseModel(
    record: Record.fromJson(json["record"]),
  );

  Map<String, dynamic> toJson() => {
    "record": record?.toJson(),
  };
}

class Record {
  Record({
    this.id,
    this.profileUserId,
    this.profileMultiImg,
    this.profileStatus,
    this.profileVerifyStatus,
    this.profileCreatedAt,
    this.profileUpdatedAt,
    this.profileDeleted,
    this.v,
  });

  String? id;
  String? profileUserId;
  String? profileMultiImg;
  int? profileStatus;
  int? profileVerifyStatus;
  DateTime? profileCreatedAt;
  DateTime? profileUpdatedAt;
  dynamic profileDeleted;
  int? v;

  factory Record.fromJson(Map<String, dynamic> json) => Record(
    id: json["_id"],
    profileUserId: json["profile_user_id"],
    profileMultiImg: json["profile_multi_img"],
    profileStatus: json["profile_status"],
    profileVerifyStatus: json["profile_verify_status"],
    profileCreatedAt: DateTime.parse(json["profile_created_at"]),
    profileUpdatedAt: DateTime.parse(json["profile_updated_at"]),
    profileDeleted: json["profile_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profile_user_id": profileUserId,
    "profile_multi_img": profileMultiImg,
    "profile_status": profileStatus,
    "profile_verify_status": profileVerifyStatus,
    "profile_created_at": profileCreatedAt?.toIso8601String(),
    "profile_updated_at": profileUpdatedAt?.toIso8601String(),
    "profile_deleted": profileDeleted,
    "__v": v,
  };
}
