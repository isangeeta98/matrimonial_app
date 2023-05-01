// To parse this JSON data, do
//
//     final newMatchResponseModel = newMatchResponseModelFromJson(jsonString);

import 'dart:convert';

NewMatchResponseModel newMatchResponseModelFromJson(String str) => NewMatchResponseModel.fromJson(json.decode(str));

String newMatchResponseModelToJson(NewMatchResponseModel data) => json.encode(data.toJson());

class NewMatchResponseModel {
  NewMatchResponseModel({
    this.data,
  });

  List<NewMatchData>? data;

  factory NewMatchResponseModel.fromJson(Map<String, dynamic> json) => NewMatchResponseModel(
    data: List<NewMatchData>.from(json["data"].map((x) => NewMatchData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class NewMatchData {
  NewMatchData({
    this.id,
    this.fristname,
    this.middlename,
    this.lastname,
    this.profileCreateFor,
    this.dob,
    this.mobile,
    this.email,
    this.ipAddress,
    this.acceptTermCondition,
    this.password,
    this.verifiedStatus,
    this.activeStatus,
    this.resetPasswordToken,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.v,
  });

  String? id;
  String? fristname;
  String? middlename;
  String? lastname;
  String? profileCreateFor;
  DateTime? dob;
  String? mobile;
  String? email;
  String? ipAddress;
  bool? acceptTermCondition;
  String? password;
  bool? verifiedStatus;
  int? activeStatus;
  dynamic resetPasswordToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? v;

  factory NewMatchData.fromJson(Map<String, dynamic> json) => NewMatchData(
    id: json["_id"],
    fristname: json["fristname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    profileCreateFor: json["profile_create_for"],
    dob: DateTime.parse(json["DOB"]),
    mobile: json["mobile"],
    email: json["email"],
    ipAddress: json["ipAddress"],
    acceptTermCondition: json["accept_term_condition"],
    password: json["password"],
    verifiedStatus: json["verified_status"],
    activeStatus: json["active_status"],
    resetPasswordToken: json["reset_password_token"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fristname": fristname,
    "middlename": middlename,
    "lastname": lastname,
    "profile_create_for": profileCreateFor,
    "DOB": "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
    "mobile": mobile,
    "email": email,
    "ipAddress": ipAddress,
    "accept_term_condition": acceptTermCondition,
    "password": password,
    "verified_status": verifiedStatus,
    "active_status": activeStatus,
    "reset_password_token": resetPasswordToken,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "__v": v,
  };
}
