// To parse this JSON data, do
//
//     final editPersonalDataResponseModel = editPersonalDataResponseModelFromJson(jsonString);

import 'dart:convert';

EditPersonalDataResponseModel editPersonalDataResponseModelFromJson(String str) => EditPersonalDataResponseModel.fromJson(json.decode(str));

String editPersonalDataResponseModelToJson(EditPersonalDataResponseModel data) => json.encode(data.toJson());

class EditPersonalDataResponseModel {
  EditPersonalDataResponseModel({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  Data? data;
  String? message;

  factory EditPersonalDataResponseModel.fromJson(Map<String, dynamic> json) => EditPersonalDataResponseModel(
    status: json["status"],
    //data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    //"data": data?.toJson() == null ? null : data?.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    this.pUserId,
    this.pProfileCreateFor,
    this.pReligion,
    this.pCaste,
    this.pMaritialStatus,
    this.pNoOfChild,
    this.pNoOfChildLivingWithYou,
    this.pGender,
    this.pDob,
    this.pTob,
    this.pPob,
    this.pResidencialStatus,
    this.pImmigrateDiffrentCountry,
    this.pLivingWithFamily,
    this.pDiet,
    this.pAnnulIncome,
    this.pDrink,
    this.pSmoke,
    this.pHeight,
    this.pBodyType,
    this.pSpeciallyAbility,
    this.pSpeciallyAbilityDescription,
    this.pTentativeTime,
    this.pCreatedAt,
    this.pUpdatedAt,
  });

  String? pUserId;
  String? pProfileCreateFor;
  String? pReligion;
  String? pCaste;
  String? pMaritialStatus;
  String? pNoOfChild;
  String? pNoOfChildLivingWithYou;
  String? pGender;
  DateTime? pDob;
  String? pTob;
  String? pPob;
  String? pResidencialStatus;
  String? pImmigrateDiffrentCountry;
  String? pLivingWithFamily;
  String? pDiet;
  String? pAnnulIncome;
  String? pDrink;
  String? pSmoke;
  String? pHeight;
  String? pBodyType;
  String? pSpeciallyAbility;
  String? pSpeciallyAbilityDescription;
  String? pTentativeTime;
  DateTime? pCreatedAt;
  DateTime? pUpdatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    pUserId: json["p_user_id"],
    pProfileCreateFor: json["p_profile_create_for"],
    pReligion: json["p_religion"],
    pCaste: json["p_caste"],
    pMaritialStatus: json["p_maritial_status"],
    pNoOfChild: json["p_no_of_child"],
    pNoOfChildLivingWithYou: json["p_no_of_child_living_with_you"],
    pGender: json["p_gender"],
    pDob: DateTime.parse(json["p_dob"]),
    pTob: json["p_tob"],
    pPob: json["p_pob"],
    pResidencialStatus: json["p_residencial_status"],
    pImmigrateDiffrentCountry: json["p_immigrate_diffrent_country"],
    pLivingWithFamily: json["p_living_with_family"],
    pDiet: json["p_diet"],
    pAnnulIncome: json["p_annulIncome"],
    pDrink: json["p_drink"],
    pSmoke: json["p_smoke"],
    pHeight: json["p_height"],
    pBodyType: json["p_bodyType"],
    pSpeciallyAbility: json["p_specially_ability"],
    pSpeciallyAbilityDescription: json["p_specially_ability_description"],
    pTentativeTime: json["p_tentative_time"],
    pCreatedAt: DateTime.parse(json["p_created_at"]),
    pUpdatedAt: DateTime.parse(json["p_updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "p_user_id": pUserId,
    "p_profile_create_for": pProfileCreateFor,
    "p_religion": pReligion,
    "p_caste": pCaste,
    "p_maritial_status": pMaritialStatus,
    "p_no_of_child": pNoOfChild,
    "p_no_of_child_living_with_you": pNoOfChildLivingWithYou,
    "p_gender": pGender,
    "p_dob": "${pDob?.year.toString().padLeft(4, '0')}-${pDob?.month.toString().padLeft(2, '0')}-${pDob?.day.toString().padLeft(2, '0')}",
    "p_tob": pTob,
    "p_pob": pPob,
    "p_residencial_status": pResidencialStatus,
    "p_immigrate_diffrent_country": pImmigrateDiffrentCountry,
    "p_living_with_family": pLivingWithFamily,
    "p_diet": pDiet,
    "p_annulIncome": pAnnulIncome,
    "p_drink": pDrink,
    "p_smoke": pSmoke,
    "p_height": pHeight,
    "p_bodyType": pBodyType,
    "p_specially_ability": pSpeciallyAbility,
    "p_specially_ability_description": pSpeciallyAbilityDescription,
    "p_tentative_time": pTentativeTime,
    "p_created_at": pCreatedAt?.toIso8601String(),
    "p_updated_at": pUpdatedAt?.toIso8601String(),
  };
}
