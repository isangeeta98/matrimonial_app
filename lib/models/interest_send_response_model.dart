// To parse this JSON data, do
//
//     final interestSendResponseModel = interestSendResponseModelFromJson(jsonString);

import 'dart:convert';

InterestSendResponseModel interestSendResponseModelFromJson(String str) => InterestSendResponseModel.fromJson(json.decode(str));

String interestSendResponseModelToJson(InterestSendResponseModel data) => json.encode(data.toJson());

class InterestSendResponseModel {
  InterestSendResponseModel({
    this.post,
  });

  List<Post>? post;

  factory InterestSendResponseModel.fromJson(Map<String, dynamic> json) => InterestSendResponseModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.eiSenderId,
    this.eiRecieverId,
    this.eiMessage,
    this.eiStatus,
    this.eiCreatedAt,
    this.eiUpdatedAt,
    this.eiDeleted,
    this.v,
  });

  String? id;
  String? eiSenderId;
  String? eiRecieverId;
  String? eiMessage;
  int? eiStatus;
  DateTime? eiCreatedAt;
  DateTime? eiUpdatedAt;
  bool? eiDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    eiSenderId: json["ei_senderId"],
    eiRecieverId: json["ei_recieverId"],
    eiMessage: json["ei_message"],
    eiStatus: json["ei_status"],
    eiCreatedAt: DateTime.parse(json["ei_created_at"]),
    eiUpdatedAt: DateTime.parse(json["ei_updated_at"]),
    eiDeleted: json["ei_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ei_senderId": eiSenderId,
    "ei_recieverId": eiRecieverId,
    "ei_message": eiMessage,
    "ei_status": eiStatus,
    "ei_created_at": eiCreatedAt?.toIso8601String(),
    "ei_updated_at": eiUpdatedAt?.toIso8601String(),
    "ei_deleted": eiDeleted,
    "__v": v,
  };
}
