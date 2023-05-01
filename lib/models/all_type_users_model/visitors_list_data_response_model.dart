// To parse this JSON data, do
//
//     final getVisitorListResModel = getVisitorListResModelFromJson(jsonString);

import 'dart:convert';

GetVisitorListResModel getVisitorListResModelFromJson(String str) => GetVisitorListResModel.fromJson(json.decode(str));

String getVisitorListResModelToJson(GetVisitorListResModel data) => json.encode(data.toJson());

class GetVisitorListResModel {
  List<UserId>? userIds;

  GetVisitorListResModel({
    this.userIds,
  });

  factory GetVisitorListResModel.fromJson(Map<String, dynamic> json) => GetVisitorListResModel(
    userIds: List<UserId>.from(json["userIds"].map((x) => UserId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userIds": List<dynamic>.from(userIds!.map((x) => x.toJson())),
  };
}

class UserId {
  String? id;
  String? visitorId;

  UserId({
    this.id,
    this.visitorId,
  });

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
    visitorId: json["visitor_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "visitor_id": visitorId,
  };
}
