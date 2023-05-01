// To parse this JSON data, do
//
//     final annualIncomeResponseModel = annualIncomeResponseModelFromJson(jsonString);

import 'dart:convert';

AnnualIncomeResponseModel annualIncomeResponseModelFromJson(String str) => AnnualIncomeResponseModel.fromJson(json.decode(str));

String annualIncomeResponseModelToJson(AnnualIncomeResponseModel data) => json.encode(data.toJson());

class AnnualIncomeResponseModel {
  AnnualIncomeResponseModel({
    this.data,
  });

  List<AnnualIncomeData>? data;

  factory AnnualIncomeResponseModel.fromJson(Map<String, dynamic> json) => AnnualIncomeResponseModel(
    data: List<AnnualIncomeData>.from(json["data"].map((x) => AnnualIncomeData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AnnualIncomeData {
  AnnualIncomeData({
    this.id,
    this.aiTitle,
    this.aiStatus,
    this.aiCreatedAt,
    this.aiUpdatedAt,
    this.aiDeleted,
    this.v,
  });

  String? id;
  String? aiTitle;
  int? aiStatus;
  DateTime? aiCreatedAt;
  DateTime? aiUpdatedAt;
  dynamic aiDeleted;
  int? v;

  factory AnnualIncomeData.fromJson(Map<String, dynamic> json) => AnnualIncomeData(
    id: json["_id"],
    aiTitle: json["ai_title"],
    aiStatus: json["ai_status"],
    aiCreatedAt: DateTime.parse(json["ai_created_at"]),
    aiUpdatedAt: DateTime.parse(json["ai_updated_at"]),
    aiDeleted: json["ai_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "ai_title": aiTitle,
    "ai_status": aiStatus,
    "ai_created_at": aiCreatedAt?.toIso8601String(),
    "ai_updated_at": aiUpdatedAt?.toIso8601String(),
    "ai_deleted": aiDeleted,
    "__v": v,
  };
}
