// To parse this JSON data, do
//
//     final familyDetailResModel = familyDetailResModelFromJson(jsonString);

import 'dart:convert';

FamilyDetailResModel familyDetailResModelFromJson(String str) => FamilyDetailResModel.fromJson(json.decode(str));

String familyDetailResModelToJson(FamilyDetailResModel data) => json.encode(data.toJson());

class FamilyDetailResModel {
  FamilyDetailResModel({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  Data? data;
  String? message;

  factory FamilyDetailResModel.fromJson(Map<String, dynamic> json) => FamilyDetailResModel(
    status: json["status"],
    //data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    //"data": data.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.fUserId,
    this.fFatherName,
    this.fFatherGotra,
    this.fFOccupationDetails,
    this.fFOccupationStatus,
    this.fMotherName,
    this.fMotherGotra,
    this.fFamilyStatus,
    this.fFamilyType,
    this.fFamilyValue,
    this.fNoOfSister,
    this.fFamilyIncome,
    this.fNoOfSisterMarried,
    this.fNoOfBrother,
    this.fNoOfBrotherMarried,
    this.fMOccupationDetails,
    this.fMOccupationStatus,
  });

  String? fUserId;
  String? fFatherName;
  String? fFatherGotra;
  String? fFOccupationDetails;
  String? fFOccupationStatus;
  String? fMotherName;
  String? fMotherGotra;
  String? fFamilyStatus;
  String? fFamilyType;
  String? fFamilyValue;
  String? fNoOfSister;
  String? fFamilyIncome;
  String? fNoOfSisterMarried;
  String? fNoOfBrother;
  String? fNoOfBrotherMarried;
  String? fMOccupationDetails;
  String? fMOccupationStatus;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    fUserId: json["f_user_id"],
    fFatherName: json["f_father_name"],
    fFatherGotra: json["f_father_gotra"],
    fFOccupationDetails: json["f_f_occupation_details"],
    fFOccupationStatus: json["f_f_occupation_status"],
    fMotherName: json["f_mother_name"],
    fMotherGotra: json["f_mother_gotra"],
    fFamilyStatus: json["f_family_status"],
    fFamilyType: json["f_family_type"],
    fFamilyValue: json["f_family_value"],
    fNoOfSister: json["f_no_of_sister"],
    fFamilyIncome: json["f_family_income"],
    fNoOfSisterMarried: json["f_no_of_sister_married"],
    fNoOfBrother: json["f_no_of_brother"],
    fNoOfBrotherMarried: json["f_no_of_brother_married"],
    fMOccupationDetails: json["f_m_occupation_details"],
    fMOccupationStatus: json["f_m_occupation_status"],
  );

  Map<String, dynamic> toJson() => {
    "f_user_id": fUserId,
    "f_father_name": fFatherName,
    "f_father_gotra": fFatherGotra,
    "f_f_occupation_details": fFOccupationDetails,
    "f_f_occupation_status": fFOccupationStatus,
    "f_mother_name": fMotherName,
    "f_mother_gotra": fMotherGotra,
    "f_family_status": fFamilyStatus,
    "f_family_type": fFamilyType,
    "f_family_value": fFamilyValue,
    "f_no_of_sister": fNoOfSister,
    "f_family_income": fFamilyIncome,
    "f_no_of_sister_married": fNoOfSisterMarried,
    "f_no_of_brother": fNoOfBrother,
    "f_no_of_brother_married": fNoOfBrotherMarried,
    "f_m_occupation_details": fMOccupationDetails,
    "f_m_occupation_status": fMOccupationStatus,
  };
}
