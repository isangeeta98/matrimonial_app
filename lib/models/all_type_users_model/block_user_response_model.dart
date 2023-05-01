// To parse this JSON data, do
//
//     final blockUserResponseModel = blockUserResponseModelFromJson(jsonString);

import 'dart:convert';

BlockUserResponseModel blockUserResponseModelFromJson(String str) => BlockUserResponseModel.fromJson(json.decode(str));

String blockUserResponseModelToJson(BlockUserResponseModel data) => json.encode(data.toJson());

class BlockUserResponseModel {
  BlockUserResponseModel({
    this.post,
  });

  List<Post>? post;

  factory BlockUserResponseModel.fromJson(Map<String, dynamic> json) => BlockUserResponseModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.bpUserId,
    this.bpBlockUserId,
    this.bpStatus,
    this.bpCreatedAt,
    this.bpUpdatedAt,
    this.bpDeleted,
    this.v,
  });

  String? id;
  String? bpUserId;
  String? bpBlockUserId;
  int? bpStatus;
  DateTime? bpCreatedAt;
  DateTime? bpUpdatedAt;
  bool? bpDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    bpUserId: json["bp_userId"],
    bpBlockUserId: json["bp_block_userId"],
    bpStatus: json["bp_status"],
    bpCreatedAt: DateTime.parse(json["bp_created_at"]),
    bpUpdatedAt: DateTime.parse(json["bp_updated_at"]),
    bpDeleted: json["bp_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "bp_userId": bpUserId,
    "bp_block_userId": bpBlockUserId,
    "bp_status": bpStatus,
    "bp_created_at": bpCreatedAt?.toIso8601String(),
    "bp_updated_at": bpUpdatedAt?.toIso8601String(),
    "bp_deleted": bpDeleted,
    "__v": v,
  };
}

