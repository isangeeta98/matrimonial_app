// To parse this JSON data, do
//
//     final getImagesResponseModel = getImagesResponseModelFromJson(jsonString);

import 'dart:convert';

GetImagesResponseModel getImagesResponseModelFromJson(String str) => GetImagesResponseModel.fromJson(json.decode(str));

String getImagesResponseModelToJson(GetImagesResponseModel data) => json.encode(data.toJson());

class GetImagesResponseModel {
  GetImagesResponseModel({
    this.post,
  });

  List<Post>? post;

  factory GetImagesResponseModel.fromJson(Map<String, dynamic> json) => GetImagesResponseModel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
  };
}

class Post {
  Post({
    this.id,
    this.profileUserId,
    this.profileMultiImg,
    this.profileStatus,
    this.profileCreatedAt,
    this.profileUpdatedAt,
    this.profileDeleted,
    this.v,
  });

  String? id;
  String? profileUserId;
  String? profileMultiImg;
  int? profileStatus;
  DateTime? profileCreatedAt;
  DateTime? profileUpdatedAt;
  dynamic profileDeleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    profileUserId: json["profile_user_id"],
    profileMultiImg: json["profile_multi_img"],
    profileStatus: json["profile_status"],
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
    "profile_created_at": profileCreatedAt?.toIso8601String(),
    "profile_updated_at": profileUpdatedAt?.toIso8601String(),
    "profile_deleted": profileDeleted,
    "__v": v,
  };
}
