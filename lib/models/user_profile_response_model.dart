// To parse this JSON data, do
//
//     final userProfileResponseModel = userProfileResponseModelFromJson(jsonString);

import 'dart:convert';

UserProfileResponseModel userProfileResponseModelFromJson(String str) => UserProfileResponseModel.fromJson(json.decode(str));

String userProfileResponseModelToJson(UserProfileResponseModel data) => json.encode(data.toJson());

class UserProfileResponseModel {
  UserProfileResponseModel({
    this.profileData,
  });

  ProfileData? profileData;

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) => UserProfileResponseModel(
    profileData: ProfileData.fromJson(json["profileData"]),
  );

  Map<String, dynamic> toJson() => {
    "profileData": profileData!.toJson(),
  };
}

class ProfileData {
  ProfileData({
    this.id,
    this.fristname,
    this.middlename,
    this.lastname,
    this.profileCreateFor,
    this.gender,
    this.dob,
    this.mobile,
    this.email,
  });

  String? id;
  String? fristname;
  String? middlename;
  String? lastname;
  String? profileCreateFor;
  String? gender;
  DateTime? dob;
  String? mobile;
  String? email;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    id: json["_id"],
    fristname: json["fristname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    profileCreateFor: json["profile_create_for"],
    gender: json["gender"],
    dob: DateTime.parse(json["DOB"]),
    mobile: json["mobile"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fristname": fristname,
    "middlename": middlename,
    "lastname": lastname,
    "profile_create_for": profileCreateFor,
    "gender": gender,
    "DOB": "${dob?.year.toString().padLeft(4, '0')}-${dob?.month.toString().padLeft(2, '0')}-${dob?.day.toString().padLeft(2, '0')}",
    "mobile": mobile,
    "email": email,
  };
}
