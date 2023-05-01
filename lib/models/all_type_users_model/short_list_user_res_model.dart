// To parse this JSON data, do
//
//     final shortListUserResponseModel = shortListUserResponseModelFromJson(jsonString);

import 'dart:convert';

ShortListUserResponseModel shortListUserResponseModelFromJson(String str) => ShortListUserResponseModel.fromJson(json.decode(str));

String shortListUserResponseModelToJson(ShortListUserResponseModel data) => json.encode(data.toJson());

class ShortListUserResponseModel {
  ShortListUserResponseModel({
    this.post,
  });

  List<Post>? post;

  factory ShortListUserResponseModel.fromJson(Map<String, dynamic> json) => ShortListUserResponseModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.slUserId,
    this.slShortlistUserId,
    this.slStatus,
    this.slCreatedAt,
    this.slUpdatedAt,
    this.slDeleted,
    this.v,
  });

  String? id;
  String? slUserId;
  String? slShortlistUserId;
  int? slStatus;
  DateTime? slCreatedAt;
  DateTime? slUpdatedAt;
  bool? slDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    slUserId: json["sl_userId"],
    slShortlistUserId: json["sl_shortlist_userId"],
    slStatus: json["sl_status"],
    slCreatedAt: DateTime.parse(json["sl_created_at"]),
    slUpdatedAt: DateTime.parse(json["sl_updated_at"]),
    slDeleted: json["sl_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "sl_userId": slUserId,
    "sl_shortlist_userId": slShortlistUserId,
    "sl_status": slStatus,
    "sl_created_at": slCreatedAt?.toIso8601String(),
    "sl_updated_at": slUpdatedAt?.toIso8601String(),
    "sl_deleted": slDeleted,
    "__v": v,
  };
}

