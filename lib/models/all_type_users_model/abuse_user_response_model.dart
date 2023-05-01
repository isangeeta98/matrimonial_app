// To parse this JSON data, do
//
//     final abuseUserResponseModel = abuseUserResponseModelFromJson(jsonString);

import 'dart:convert';

AbuseUserResponseModel abuseUserResponseModelFromJson(String str) => AbuseUserResponseModel.fromJson(json.decode(str));

String abuseUserResponseModelToJson(AbuseUserResponseModel data) => json.encode(data.toJson());

class AbuseUserResponseModel {
  AbuseUserResponseModel({
    this.post,
  });

  List<Post>? post;

  factory AbuseUserResponseModel.fromJson(Map<String, dynamic> json) => AbuseUserResponseModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.apUserId,
    this.apAbuseUserId,
    this.apComment,
    this.apStatus,
    this.apCreatedAt,
    this.apUpdatedAt,
    this.apDeleted,
    this.v,
  });

  String? id;
  String? apUserId;
  String? apAbuseUserId;
  String? apComment;
  int? apStatus;
  DateTime? apCreatedAt;
  DateTime? apUpdatedAt;
  bool? apDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    apUserId: json["ap_userId"],
    apAbuseUserId: json["ap_abuse_userId"],
    apComment: json["ap_comment"],
    apStatus: json["ap_status"],
    apCreatedAt: DateTime.parse(json["ap_created_at"]),
    apUpdatedAt: DateTime.parse(json["ap_updated_at"]),
    apDeleted: json["ap_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ap_userId": apUserId,
    "ap_abuse_userId": apAbuseUserId,
    "ap_comment": apComment,
    "ap_status": apStatus,
    "ap_created_at": apCreatedAt?.toIso8601String(),
    "ap_updated_at": apUpdatedAt?.toIso8601String(),
    "ap_deleted": apDeleted,
    "__v": v,
  };
}

