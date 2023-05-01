// To parse this JSON data, do
//
//     final partnerPreferenceResModel = partnerPreferenceResModelFromJson(jsonString);

import 'dart:convert';

PartnerPreferenceResModel partnerPreferenceResModelFromJson(String str) => PartnerPreferenceResModel.fromJson(json.decode(str));

String partnerPreferenceResModelToJson(PartnerPreferenceResModel data) => json.encode(data.toJson());

class PartnerPreferenceResModel {
  PartnerPreferenceResModel({
    this.message,
    this.statusCode,
  });

  String? message;
  int? statusCode;

  factory PartnerPreferenceResModel.fromJson(Map<String, dynamic> json) => PartnerPreferenceResModel(
    message: json["message"],
    statusCode: json["status_code"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status_code": statusCode,
  };
}
