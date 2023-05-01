// To parse this JSON data, do
//
//     final getLocationMatchResponseModel = getLocationMatchResponseModelFromJson(jsonString);

import 'dart:convert';

GetLocationMatchResponseModel getLocationMatchResponseModelFromJson(String str) => GetLocationMatchResponseModel.fromJson(json.decode(str));

String getLocationMatchResponseModelToJson(GetLocationMatchResponseModel data) => json.encode(data.toJson());

class GetLocationMatchResponseModel {
  GetLocationMatchResponseModel({
    this.userIds,
  });

  List<UserId>? userIds;

  factory GetLocationMatchResponseModel.fromJson(Map<String, dynamic> json) => GetLocationMatchResponseModel(
    userIds: List<UserId>.from(json["UserIds"].map((x) => UserId.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "UserIds": List<dynamic>.from(userIds!.map((x) => x.toJson())),
  };
}

class UserId {
  UserId({
    this.id,
  });

  String? id;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
  };
}
