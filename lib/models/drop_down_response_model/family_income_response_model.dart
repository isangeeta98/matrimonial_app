// To parse this JSON data, do
//
//     final familyIncomeResponseModel = familyIncomeResponseModelFromJson(jsonString);

import 'dart:convert';

FamilyIncomeResponseModel familyIncomeResponseModelFromJson(String str) => FamilyIncomeResponseModel.fromJson(json.decode(str));

String familyIncomeResponseModelToJson(FamilyIncomeResponseModel data) => json.encode(data.toJson());

class FamilyIncomeResponseModel {
  FamilyIncomeResponseModel({
    this.data,
  });

  List<FamilyIncomeData>? data;

  factory FamilyIncomeResponseModel.fromJson(Map<String, dynamic> json) => FamilyIncomeResponseModel(
    data: List<FamilyIncomeData>.from(json["data"].map((x) => FamilyIncomeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class FamilyIncomeData {
  FamilyIncomeData({
    this.id,
    this.fiTitle,
     this.fiStatus,
     this.fiCreatedAt,
     this.fiUpdatedAt,
    this.fiDeleted,
     this.v,
  });

  String? id;
  String? fiTitle;
  int? fiStatus;
  DateTime? fiCreatedAt;
  DateTime? fiUpdatedAt;
  dynamic fiDeleted;
  int? v;

  factory FamilyIncomeData.fromJson(Map<String, dynamic> json) => FamilyIncomeData(
    id: json["_id"],
    fiTitle: json["fi_title"],
    fiStatus: json["fi_status"],
    fiCreatedAt: DateTime.parse(json["fi_created_at"]),
    fiUpdatedAt: DateTime.parse(json["fi_updated_at"]),
    fiDeleted: json["fi_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fi_title": fiTitle,
    "fi_status": fiStatus,
    "fi_created_at": fiCreatedAt?.toIso8601String(),
    "fi_updated_at": fiUpdatedAt?.toIso8601String(),
    "fi_deleted": fiDeleted,
    "__v": v,
  };
}
