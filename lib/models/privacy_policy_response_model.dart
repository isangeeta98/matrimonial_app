// To parse this JSON data, do
//
//     final privacyPolicyResponseModel = privacyPolicyResponseModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyResponseModel privacyPolicyResponseModelFromJson(String str) => PrivacyPolicyResponseModel.fromJson(json.decode(str));

String privacyPolicyResponseModelToJson(PrivacyPolicyResponseModel data) => json.encode(data.toJson());

class PrivacyPolicyResponseModel {
  PrivacyPolicyResponseModel({
    this.status,
    this.data,
  });

  int? status;
  PrivacyData? data;

  factory PrivacyPolicyResponseModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyResponseModel(
    status: json["status"],
    data: PrivacyData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class PrivacyData {
  PrivacyData({
    this.id,
    this.privacyDescription,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? privacyDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory PrivacyData.fromJson(Map<String, dynamic> json) => PrivacyData(
    id: json["_id"],
    privacyDescription: json["privacy_description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "privacy_description": privacyDescription,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
