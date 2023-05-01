// To parse this JSON data, do
//
//     final viewContactListResModel = viewContactListResModelFromJson(jsonString);

import 'dart:convert';

ViewContactListResModel viewContactListResModelFromJson(String str) => ViewContactListResModel.fromJson(json.decode(str));

String viewContactListResModelToJson(ViewContactListResModel data) => json.encode(data.toJson());

class ViewContactListResModel {
  List<Post>? post;

  ViewContactListResModel({
    this.post,
  });

  factory ViewContactListResModel.fromJson(Map<String, dynamic> json) => ViewContactListResModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  String? id;
  String? vcpUserId;
  String? vcpViewUserId;
  int? vcpStatus;
  DateTime? vcpCreatedAt;
  DateTime? vcpUpdatedAt;
  bool? vcpDeleted;
  int? v;

  Post({
    this.id,
    this.vcpUserId,
    this.vcpViewUserId,
    this.vcpStatus,
    this.vcpCreatedAt,
    this.vcpUpdatedAt,
    this.vcpDeleted,
    this.v,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    vcpUserId: json["vcp_userId"],
    vcpViewUserId: json["vcp_view_userId"],
    vcpStatus: json["vcp_status"],
    vcpCreatedAt: DateTime.parse(json["vcp_created_at"]),
    vcpUpdatedAt: DateTime.parse(json["vcp_updated_at"]),
    vcpDeleted: json["vcp_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "vcp_userId": vcpUserId,
    "vcp_view_userId": vcpViewUserId,
    "vcp_status": vcpStatus,
    "vcp_created_at": vcpCreatedAt?.toIso8601String(),
    "vcp_updated_at": vcpUpdatedAt?.toIso8601String(),
    "vcp_deleted": vcpDeleted,
    "__v": v,
  };
}
