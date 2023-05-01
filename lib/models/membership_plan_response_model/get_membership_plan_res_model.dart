// To parse this JSON data, do
//
//     final getMemberShipPlanResModel = getMemberShipPlanResModelFromJson(jsonString);

import 'dart:convert';

GetMemberShipPlanResModel getMemberShipPlanResModelFromJson(String str) => GetMemberShipPlanResModel.fromJson(json.decode(str));

String getMemberShipPlanResModelToJson(GetMemberShipPlanResModel data) => json.encode(data.toJson());

class GetMemberShipPlanResModel {
  GetMemberShipPlanResModel({
    this.data,
  });

  List<MembershipData>? data;

  factory GetMemberShipPlanResModel.fromJson(Map<String, dynamic> json) => GetMemberShipPlanResModel(
    data: List<MembershipData>.from(json["data"].map((x) => MembershipData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class MembershipData {
  MembershipData({
    this.id,
    this.mpIcon,
    this.mpName,
    this.mpDuration,
    this.mpPrice,
    this.mpDisPrice,
    this.mpDirContactCount,
    this.mpStatus,
    this.mpCreatedAt,
    this.mpUpdatedAt,
    this.mpDeletedAt,
    this.v,
  });

  String? id;
  String? mpIcon;
  String? mpName;
  String? mpDuration;
  int? mpPrice;
  int? mpDisPrice;
  int? mpDirContactCount;
  int? mpStatus;
  DateTime? mpCreatedAt;
  DateTime? mpUpdatedAt;
  dynamic mpDeletedAt;
  int? v;

  factory MembershipData.fromJson(Map<String, dynamic> json) => MembershipData(
    id: json["_id"],
    mpIcon: json["mp_icon"],
    mpName: json["mp_name"],
    mpDuration: json["mp_duration"],
    mpPrice: json["mp_price"],
    mpDisPrice: json["mp_dis_price"],
    mpDirContactCount: json["mp_dir_contact_count"],
    mpStatus: json["mp_status"],
    mpCreatedAt: DateTime.parse(json["mp_created_at"]),
    mpUpdatedAt: DateTime.parse(json["mp_updated_at"]),
    mpDeletedAt: json["mp_deleted_at"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "mp_icon": mpIcon,
    "mp_name": mpName,
    "mp_duration": mpDuration,
    "mp_price": mpPrice,
    "mp_dis_price": mpDisPrice,
    "mp_dir_contact_count": mpDirContactCount,
    "mp_status": mpStatus,
    "mp_created_at": mpCreatedAt?.toIso8601String(),
    "mp_updated_at": mpUpdatedAt?.toIso8601String(),
    "mp_deleted_at": mpDeletedAt,
    "__v": v,
  };
}
