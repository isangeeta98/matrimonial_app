// To parse this JSON data, do
//
//     final addOnPlanResponseModel = addOnPlanResponseModelFromJson(jsonString);

import 'dart:convert';

AddOnPlanResponseModel addOnPlanResponseModelFromJson(String str) => AddOnPlanResponseModel.fromJson(json.decode(str));

String addOnPlanResponseModelToJson(AddOnPlanResponseModel data) => json.encode(data.toJson());

class AddOnPlanResponseModel {
  AddOnPlanResponseModel({
    this.data,
  });

  List<AddonPlanData>? data;

  factory AddOnPlanResponseModel.fromJson(Map<String, dynamic> json) => AddOnPlanResponseModel(
    data: List<AddonPlanData>.from(json["data"].map((x) => AddonPlanData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class AddonPlanData {
  AddonPlanData({
    this.id,
    this.adpName,
    this.adpDuration,
    this.adpPrice,
    this.adpDisPrice,
    this.adpStandoutProfile,
    this.adpTopPlacementSearch,
    this.adpKundaliMatchCount,
    this.adpStatus,
    this.adpCreatedAt,
    this.adpUpdatedAt,
    this.adpDeletedAt,
    this.v,
  });

  String? id;
  String? adpName;
  String? adpDuration;
  int? adpPrice;
  int? adpDisPrice;
  int? adpStandoutProfile;
  int? adpTopPlacementSearch;
  int? adpKundaliMatchCount;
  int? adpStatus;
  DateTime? adpCreatedAt;
  DateTime? adpUpdatedAt;
  dynamic adpDeletedAt;
  int? v;

  factory AddonPlanData.fromJson(Map<String, dynamic> json) => AddonPlanData(
    id: json["_id"],
    adpName: json["adp_name"],
    adpDuration: json["adp_duration"],
    adpPrice: json["adp_price"],
    adpDisPrice: json["adp_dis_price"],
    adpStandoutProfile: json["adp_standout_profile"],
    adpTopPlacementSearch: json["adp_top_placement_search"],
    adpKundaliMatchCount: json["adp_kundali_match_count"],
    adpStatus: json["adp_status"],
    adpCreatedAt: DateTime.parse(json["adp_created_at"]),
    adpUpdatedAt: DateTime.parse(json["adp_updated_at"]),
    adpDeletedAt: json["adp_deleted_at"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "adp_name": adpName,
    "adp_duration": adpDuration,
    "adp_price": adpPrice,
    "adp_dis_price": adpDisPrice,
    "adp_standout_profile": adpStandoutProfile,
    "adp_top_placement_search": adpTopPlacementSearch,
    "adp_kundali_match_count": adpKundaliMatchCount,
    "adp_status": adpStatus,
    "adp_created_at": adpCreatedAt?.toIso8601String(),
    "adp_updated_at": adpUpdatedAt?.toIso8601String(),
    "adp_deleted_at": adpDeletedAt,
    "__v": v,
  };
}
