// To parse this JSON data, do
//
//     final getAllUserResponseModel = getAllUserResponseModelFromJson(jsonString);

import 'dart:convert';

GetAllUserResponseModel getAllUserResponseModelFromJson(String str) => GetAllUserResponseModel.fromJson(json.decode(str));

String getAllUserResponseModelToJson(GetAllUserResponseModel data) => json.encode(data.toJson());

class GetAllUserResponseModel {
  List<Joindatum>? joindata;

  GetAllUserResponseModel({
    this.joindata,
  });

  factory GetAllUserResponseModel.fromJson(Map<String, dynamic> json) => GetAllUserResponseModel(
    joindata: List<Joindatum>.from(json["joindata"].map((x) => Joindatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "joindata": List<dynamic>.from(joindata!.map((x) => x.toJson())),
  };
}

class Joindatum {
  String? id;
  String? fristname;
  String? middlename;
  String? lastname;
  String? profileCreateFor;
  String? gender;
  dynamic dob;
  String? mobile;
  String? email;
  int? emailVrifyStatus;
  String? ipAddress;
  bool? acceptTermCondition;
  String? password;
  int? resetPasswordToken;
  int? verifiedStatus;
  int? activeStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? v;
  DateTime? resetPasswordTokenTime;
  List<UserDatum>? userData;
  List<FamilyDetail>? familyDetails;
  List<MyAddressDetail>? myAddressDetails;
  List<Userkyc>? userkycs;
  List<Userprofile>? userprofiles;
  List<Usereducationdetail>? usereducationdetails;
  List<PartnerPerfernce>? partnerPerfernces;

  Joindatum({
    this.id,
    this.fristname,
    this.middlename,
    this.lastname,
    this.profileCreateFor,
    this.gender,
    this.dob,
    this.mobile,
    this.email,
    this.emailVrifyStatus,
    this.ipAddress,
    this.acceptTermCondition,
    this.password,
    this.resetPasswordToken,
    this.verifiedStatus,
    this.activeStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.v,
    this.resetPasswordTokenTime,
    this.userData,
    this.familyDetails,
    this.myAddressDetails,
    this.userkycs,
    this.userprofiles,
    this.usereducationdetails,
    this.partnerPerfernces,
  });

  factory Joindatum.fromJson(Map<String, dynamic> json) => Joindatum(
    id: json["_id"],
    fristname: json["fristname"],
    middlename: json["middlename"],
    lastname: json["lastname"],
    profileCreateFor: json["profile_create_for"],
    gender: json["gender"],
    dob: json["DOB"],
    mobile: json["mobile"],
    email: json["email"],
    emailVrifyStatus: json["emailVrifyStatus"],
    ipAddress: json["ipAddress"],
    acceptTermCondition: json["accept_term_condition"],
    password: json["password"],
    resetPasswordToken: json["reset_password_token"],
    verifiedStatus: json["verified_status"],
    activeStatus: json["active_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    v: json["__v"],
    resetPasswordTokenTime: json["reset_password_token_time"] == null ? null : DateTime.parse(json["reset_password_token_time"]),
    userData: List<UserDatum>.from(json["userData"].map((x) => UserDatum.fromJson(x))),
    familyDetails: List<FamilyDetail>.from(json["familyDetails"].map((x) => FamilyDetail.fromJson(x))),
    myAddressDetails: List<MyAddressDetail>.from(json["myAddressDetails"].map((x) => MyAddressDetail.fromJson(x))),
    userkycs: List<Userkyc>.from(json["userkycs"].map((x) => Userkyc.fromJson(x))),
    userprofiles: List<Userprofile>.from(json["userprofiles"].map((x) => Userprofile.fromJson(x))),
    usereducationdetails: List<Usereducationdetail>.from(json["usereducationdetails"].map((x) => Usereducationdetail.fromJson(x))),
    partnerPerfernces: List<PartnerPerfernce>.from(json["partner_perfernces"].map((x) => PartnerPerfernce.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "fristname": fristname,
    "middlename": middlename,
    "lastname": lastname,
    "profile_create_for": profileCreateFor,
    "gender": gender,
    "DOB": dob,
    "mobile": mobile,
    "email": email,
    "emailVrifyStatus": emailVrifyStatus,
    "ipAddress": ipAddress,
    "accept_term_condition": acceptTermCondition,
    "password": password,
    "reset_password_token": resetPasswordToken,
    "verified_status": verifiedStatus,
    "active_status": activeStatus,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "__v": v,
    "reset_password_token_time": resetPasswordTokenTime?.toIso8601String(),
    "userData": List<dynamic>.from(userData!.map((x) => x.toJson())),
    "familyDetails": List<dynamic>.from(familyDetails!.map((x) => x.toJson())),
    "myAddressDetails": List<dynamic>.from(myAddressDetails!.map((x) => x.toJson())),
    "userkycs": List<dynamic>.from(userkycs!.map((x) => x.toJson())),
    "userprofiles": List<dynamic>.from(userprofiles!.map((x) => x.toJson())),
    "usereducationdetails": List<dynamic>.from(usereducationdetails!.map((x) => x.toJson())),
    "partner_perfernces": List<dynamic>.from(partnerPerfernces!.map((x) => x.toJson())),
  };
}

class FamilyDetail {
  String? id;
  String? fUserId;
  String? fFatherName;
  String? fFatherGotra;
  String? fFOccupationDetails;
  String? fFOccupationStatus;
  String? fMOccupationDetails;
  String? fMOccupationStatus;
  String? fMotherName;
  String? fMotherGotra;
  String? fFamilyStatus;
  String? fFamilyType;
  String? fFamilyValue;
  String? fFamilyIncome;
  int? fNoOfSister;
  int? fNoOfSisterMarried;
  int? fNoOfBrother;
  int? fNoOfBrotherMarried;
  DateTime? fCreatedAt;
  DateTime? fUpdatedAt;
  dynamic fDeleted;
  int? v;

  FamilyDetail({
    this.id,
    this.fUserId,
    this.fFatherName,
    this.fFatherGotra,
    this.fFOccupationDetails,
    this.fFOccupationStatus,
    this.fMOccupationDetails,
    this.fMOccupationStatus,
    this.fMotherName,
    this.fMotherGotra,
    this.fFamilyStatus,
    this.fFamilyType,
    this.fFamilyValue,
    this.fFamilyIncome,
    this.fNoOfSister,
    this.fNoOfSisterMarried,
    this.fNoOfBrother,
    this.fNoOfBrotherMarried,
    this.fCreatedAt,
    this.fUpdatedAt,
    this.fDeleted,
    this.v,
  });

  factory FamilyDetail.fromJson(Map<String, dynamic> json) => FamilyDetail(
    id: json["_id"],
    fUserId: json["f_user_id"],
    fFatherName: json["f_father_name"],
    fFatherGotra: json["f_father_gotra"],
    fFOccupationDetails: json["f_f_occupation_details"],
    fFOccupationStatus: json["f_f_occupation_status"],
    fMOccupationDetails: json["f_m_occupation_details"],
    fMOccupationStatus: json["f_m_occupation_status"],
    fMotherName: json["f_mother_name"],
    fMotherGotra: json["f_mother_gotra"],
    fFamilyStatus: json["f_family_status"],
    fFamilyType: json["f_family_type"],
    fFamilyValue: json["f_family_value"],
    fFamilyIncome: json["f_family_income"],
    fNoOfSister: json["f_no_of_sister"],
    fNoOfSisterMarried: json["f_no_of_sister_married"],
    fNoOfBrother: json["f_no_of_brother"],
    fNoOfBrotherMarried: json["f_no_of_brother_married"],
    fCreatedAt: DateTime.parse(json["f_created_at"]),
    fUpdatedAt: DateTime.parse(json["f_updated_at"]),
    fDeleted: json["f_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "f_user_id": fUserId,
    "f_father_name": fFatherName,
    "f_father_gotra": fFatherGotra,
    "f_f_occupation_details": fFOccupationDetails,
    "f_f_occupation_status": fFOccupationStatus,
    "f_m_occupation_details": fMOccupationDetails,
    "f_m_occupation_status": fMOccupationStatus,
    "f_mother_name": fMotherName,
    "f_mother_gotra": fMotherGotra,
    "f_family_status": fFamilyStatus,
    "f_family_type": fFamilyType,
    "f_family_value": fFamilyValue,
    "f_family_income": fFamilyIncome,
    "f_no_of_sister": fNoOfSister,
    "f_no_of_sister_married": fNoOfSisterMarried,
    "f_no_of_brother": fNoOfBrother,
    "f_no_of_brother_married": fNoOfBrotherMarried,
    "f_created_at": fCreatedAt?.toIso8601String(),
    "f_updated_at": fUpdatedAt?.toIso8601String(),
    "f_deleted": fDeleted,
    "__v": v,
  };
}


class MyAddressDetail {
  String? id;
  String? aUserId;
  String? aCountry;
  String? aState;
  String? aCity;
  String? aAddress;
  bool? aSameAddress;
  String? aPCountry;
  String? aPState;
  String? aPCity;
  String? aPAddress;
  DateTime? aCreatedAt;
  DateTime? aUpdatedAt;
  dynamic aDeleted;
  int? v;

  MyAddressDetail({
    this.id,
    this.aUserId,
    this.aCountry,
    this.aState,
    this.aCity,
    this.aAddress,
    this.aSameAddress,
    this.aPCountry,
    this.aPState,
    this.aPCity,
    this.aPAddress,
    this.aCreatedAt,
    this.aUpdatedAt,
    this.aDeleted,
    this.v,
  });

  factory MyAddressDetail.fromJson(Map<String, dynamic> json) => MyAddressDetail(
    id: json["_id"],
    aUserId: json["a_user_id"],
    aCountry: json["a_country"],
    aState: json["a_state"],
    aCity: json["a_city"],
    aAddress: json["a_address"],
    aSameAddress: json["a_same_address"],
    aPCountry: json["a_p_country"],
    aPState: json["a_p_state"],
    aPCity: json["a_p_city"],
    aPAddress: json["a_p_address"],
    aCreatedAt: DateTime.parse(json["a_created_at"]),
    aUpdatedAt: DateTime.parse(json["a_updated_at"]),
    aDeleted: json["a_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "a_user_id": aUserId,
    "a_country": aCountry,
    "a_state": aState,
    "a_city": aCity,
    "a_address": aAddress,
    "a_same_address": aSameAddress,
    "a_p_country": aPCountry,
    "a_p_state": aPState,
    "a_p_city": aPCity,
    "a_p_address": aPAddress,
    "a_created_at": aCreatedAt?.toIso8601String(),
    "a_updated_at": aUpdatedAt?.toIso8601String(),
    "a_deleted": aDeleted,
    "__v": v,
  };
}

class PartnerPerfernce {
  String? id;
  String? ppUserId;
  List<String>? maritalStatus;
  List<String>? religion;
  List<String>? caste;
  List<String>? eduction;
  List<String>? profession;
  List<String>? residencial;
  String? incomeRange;
  String? ageFrom;
  String? ageTo;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? v;

  PartnerPerfernce({
    this.id,
    this.ppUserId,
    this.maritalStatus,
    this.religion,
    this.caste,
    this.eduction,
    this.profession,
    this.residencial,
    this.incomeRange,
    this.ageFrom,
    this.ageTo,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.v,
  });

  factory PartnerPerfernce.fromJson(Map<String, dynamic> json) => PartnerPerfernce(
    id: json["_id"],
    ppUserId: json["pp_userId"],
    maritalStatus: List<String>.from(json["marital_status"].map((x) => x)),
    religion: List<String>.from(json["religion"].map((x) => x)),
    caste: List<String>.from(json["caste"].map((x) => x)),
    eduction: List<String>.from(json["eduction"].map((x) => x)),
    profession: List<String>.from(json["profession"].map((x) => x)),
    residencial: List<String>.from(json["residencial"].map((x) => x)),
    incomeRange: json["income_range"],
    ageFrom: json["age_from"],
    ageTo: json["age_to"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "pp_userId": ppUserId,
    "marital_status": List<dynamic>.from(maritalStatus!.map((x) => x)),
    "religion": List<dynamic>.from(religion!.map((x) => x)),
    "caste": List<dynamic>.from(caste!.map((x) => x)),
    "eduction": List<dynamic>.from(eduction!.map((x) => x)),
    "profession": List<dynamic>.from(profession!.map((x) => x)),
    "residencial": List<dynamic>.from(residencial!.map((x) => x)),
    "income_range": incomeRange,
    "age_from": ageFrom,
    "age_to": ageTo,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted_at": deletedAt,
    "__v": v,
  };
}

class UserDatum {
  String? id;
  String? pUserId;
  String? pProfileCreateFor;
  String? pFristname;
  String? pMiddlename;
  String? pLastname;
  String? pEmail;
  String? pMobile;
  String? pReligion;
  String? pCaste;
  String? pMaritialStatus;
  String? pNoOfChild;
  String? pNoOfChildLivingWithYou;
  String? pGender;
  String? pDob;
  String? pTob;
  String? pPob;
  String? pManglik;
  String? pHoroscop;
  String? pDadhi;
  String? pNamaz;
  String? pHijab;
  String? pSardar;
  String? pResidencialStatus;
  String? pImmigrateDiffrentCountry;
  String? pLivingWithFamily;
  String? pDiet;
  String? pDrink;
  String? pSmoke;
  String? pHeight;
  String? pBodyType;
  String? pSpeciallyAbility;
  String? pSpeciallyAbilityDescription;
  String? pTentativeTime;
  String? pAnnulIncome;
  DateTime? pCreatedAt;
  DateTime? pUpdatedAt;
  dynamic pDeleted;
  int? v;

  UserDatum({
    this.id,
    this.pUserId,
    this.pProfileCreateFor,
    this.pFristname,
    this.pMiddlename,
    this.pLastname,
    this.pEmail,
    this.pMobile,
    this.pReligion,
    this.pCaste,
    this.pMaritialStatus,
    this.pNoOfChild,
    this.pNoOfChildLivingWithYou,
    this.pGender,
    this.pDob,
    this.pTob,
    this.pPob,
    this.pManglik,
    this.pHoroscop,
    this.pDadhi,
    this.pNamaz,
    this.pHijab,
    this.pSardar,
    this.pResidencialStatus,
    this.pImmigrateDiffrentCountry,
    this.pLivingWithFamily,
    this.pDiet,
    this.pDrink,
    this.pSmoke,
    this.pHeight,
    this.pBodyType,
    this.pSpeciallyAbility,
    this.pSpeciallyAbilityDescription,
    this.pTentativeTime,
    this.pAnnulIncome,
    this.pCreatedAt,
    this.pUpdatedAt,
    this.pDeleted,
    this.v,
  });

  factory UserDatum.fromJson(Map<String, dynamic> json) => UserDatum(
    id: json["_id"],
    pUserId: json["p_user_id"],
    pProfileCreateFor: json["p_profile_create_for"],
    pFristname: json["p_fristname"],
    pMiddlename: json["p_middlename"],
    pLastname: json["p_lastname"],
    pEmail: json["p_email"],
    pMobile: json["p_mobile"],
    pReligion: json["p_religion"],
    pCaste: json["p_caste"],
    pMaritialStatus: json["p_maritial_status"],
    pNoOfChild: json["p_no_of_child"],
    pNoOfChildLivingWithYou: json["p_no_of_child_living_with_you"],
    pGender: json["p_gender"],
    pDob: json["p_dob"],
    pTob: json["p_tob"],
    pPob: json["p_pob"],
    pManglik: json["p_manglik"],
    pHoroscop: json["p_horoscop"],
    pDadhi: json["p_dadhi"],
    pNamaz: json["p_namaz"],
    pHijab: json["p_hijab"],
    pSardar: json["p_sardar"],
    pResidencialStatus: json["p_residencial_status"],
    pImmigrateDiffrentCountry: json["p_immigrate_diffrent_country"],
    pLivingWithFamily: json["p_living_with_family"],
    pDiet: json["p_diet"],
    pDrink: json["p_drink"],
    pSmoke: json["p_smoke"],
    pHeight: json["p_height"],
    pBodyType: json["p_bodyType"],
    pSpeciallyAbility: json["p_specially_ability"],
    pSpeciallyAbilityDescription: json["p_specially_ability_description"],
    pTentativeTime: json["p_tentative_time"],
    pAnnulIncome: json["p_annulIncome"],
    pCreatedAt: DateTime.parse(json["p_created_at"]),
    pUpdatedAt: DateTime.parse(json["p_updated_at"]),
    pDeleted: json["p_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "p_user_id": pUserId,
    "p_profile_create_for": pProfileCreateFor,
    "p_fristname": pFristname,
    "p_middlename": pMiddlename,
    "p_lastname": pLastname,
    "p_email": pEmail,
    "p_mobile": pMobile,
    "p_religion": pReligion,
    "p_caste": pCaste,
    "p_maritial_status": pMaritialStatus,
    "p_no_of_child": pNoOfChild,
    "p_no_of_child_living_with_you": pNoOfChildLivingWithYou,
    "p_gender": pGender,
    "p_dob": pDob,
    "p_tob": pTob,
    "p_pob": pPob,
    "p_manglik": pManglik,
    "p_horoscop": pHoroscop,
    "p_dadhi": pDadhi,
    "p_namaz": pNamaz,
    "p_hijab": pHijab,
    "p_sardar": pSardar,
    "p_residencial_status": pResidencialStatus,
    "p_immigrate_diffrent_country": pImmigrateDiffrentCountry,
    "p_living_with_family": pLivingWithFamily,
    "p_diet": pDiet,
    "p_drink": pDrink,
    "p_smoke": pSmoke,
    "p_height": pHeight,
    "p_bodyType": pBodyType,
    "p_specially_ability": pSpeciallyAbility,
    "p_specially_ability_description": pSpeciallyAbilityDescription,
    "p_tentative_time": pTentativeTime,
    "p_annulIncome": pAnnulIncome,
    "p_created_at": pCreatedAt?.toIso8601String(),
    "p_updated_at": pUpdatedAt?.toIso8601String(),
    "p_deleted": pDeleted,
    "__v": v,
  };
}

class Usereducationdetail {
  String? id;
  String? uEduUserId;
  String? uEduHighCategory;
  String? uEduHighSubcategroy;
  String? uEduCollegeName;
  String? uEduOccupationSector;
  String? uEduOccupationSpecialization;
  String? uEduOccupationTitle;
  String? uEduWorkDestination;
  String? uEduOrganisationName;
  DateTime? uEduCreatedAt;
  DateTime? uEduUpdatedAt;
  bool? uEduDeleted;
  int? v;
  String? uEduHighEduMaster;
  String? uEduHighEduSpecId;
  String? uEduOccupationSecId;
  String? uEduOccupationSpecId;

  Usereducationdetail({
    this.id,
    this.uEduUserId,
    this.uEduHighCategory,
    this.uEduHighSubcategroy,
    this.uEduCollegeName,
    this.uEduOccupationSector,
    this.uEduOccupationSpecialization,
    this.uEduOccupationTitle,
    this.uEduWorkDestination,
    this.uEduOrganisationName,
    this.uEduCreatedAt,
    this.uEduUpdatedAt,
    this.uEduDeleted,
    this.v,
    this.uEduHighEduMaster,
    this.uEduHighEduSpecId,
    this.uEduOccupationSecId,
    this.uEduOccupationSpecId,
  });

  factory Usereducationdetail.fromJson(Map<String, dynamic> json) => Usereducationdetail(
    id: json["_id"],
    uEduUserId: json["u_edu_userId"],
    uEduHighCategory: json["u_edu_high_category"],
    uEduHighSubcategroy: json["u_edu_high_subcategroy"],
    uEduCollegeName: json["u_edu_college_name"],
    uEduOccupationSector: json["u_edu_occupation_sector"],
    uEduOccupationSpecialization: json["u_edu_occupation_specialization"],
    uEduOccupationTitle: json["u_edu_occupation_title"],
    uEduWorkDestination: json["u_edu_work_destination"],
    uEduOrganisationName: json["u_edu_organisation_name"],
    uEduCreatedAt: DateTime.parse(json["u_edu_created_at"]),
    uEduUpdatedAt: DateTime.parse(json["u_edu_updated_at"]),
    uEduDeleted: json["u_edu_deleted"],
    v: json["__v"],
    uEduHighEduMaster: json["u_edu_high_edu_master"],
    uEduHighEduSpecId: json["u_edu_high_edu_spec_ID"],
    uEduOccupationSecId: json["u_edu_occupation_sec_ID"],
    uEduOccupationSpecId: json["u_edu_occupation_spec_ID"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "u_edu_userId": uEduUserId,
    "u_edu_high_category": uEduHighCategory,
    "u_edu_high_subcategroy": uEduHighSubcategroy,
    "u_edu_college_name": uEduCollegeName,
    "u_edu_occupation_sector": uEduOccupationSector,
    "u_edu_occupation_specialization": uEduOccupationSpecialization,
    "u_edu_occupation_title": uEduOccupationTitle,
    "u_edu_work_destination": uEduWorkDestination,
    "u_edu_organisation_name": uEduOrganisationName,
    "u_edu_created_at": uEduCreatedAt?.toIso8601String(),
    "u_edu_updated_at": uEduUpdatedAt?.toIso8601String(),
    "u_edu_deleted": uEduDeleted,
    "__v": v,
    "u_edu_high_edu_master": uEduHighEduMaster,
    "u_edu_high_edu_spec_ID": uEduHighEduSpecId,
    "u_edu_occupation_sec_ID": uEduOccupationSecId,
    "u_edu_occupation_spec_ID": uEduOccupationSpecId,
  };
}

class Userkyc {
  String? id;
  String? kycUserId;
  String? kycAdharFront;
  int? kycAdharFrontStatus;
  String? kycAdharFrontCancelReason;
  String? kycAdharBack;
  int? kycAdharBackStatus;
  String? kycAdharBackCancelReason;
  String? kycPanCard;
  int? kycPanCardStatus;
  String? kycPanCardCancelReason;
  int? kycStatus;
  DateTime? kycCreatedAt;
  DateTime? kycUpdatedAt;
  int? v;

  Userkyc({
    this.id,
    this.kycUserId,
    this.kycAdharFront,
    this.kycAdharFrontStatus,
    this.kycAdharFrontCancelReason,
    this.kycAdharBack,
    this.kycAdharBackStatus,
    this.kycAdharBackCancelReason,
    this.kycPanCard,
    this.kycPanCardStatus,
    this.kycPanCardCancelReason,
    this.kycStatus,
    this.kycCreatedAt,
    this.kycUpdatedAt,
    this.v,
  });

  factory Userkyc.fromJson(Map<String, dynamic> json) => Userkyc(
    id: json["_id"],
    kycUserId: json["kyc_user_id"],
    kycAdharFront: json["kyc_adhar_front"],
    kycAdharFrontStatus: json["kyc_adhar_front_status"],
    kycAdharFrontCancelReason: json["kyc_adhar_front_cancel_reason"],
    kycAdharBack: json["kyc_adhar_back"],
    kycAdharBackStatus: json["kyc_adhar_back_status"],
    kycAdharBackCancelReason: json["kyc_adhar_back_cancel_reason"],
    kycPanCard: json["kyc_pan_card"],
    kycPanCardStatus: json["kyc_pan_card_status"],
    kycPanCardCancelReason: json["kyc_pan_card_cancel_reason"],
    kycStatus: json["kyc_status"],
    kycCreatedAt: DateTime.parse(json["kyc_created_at"]),
    kycUpdatedAt: DateTime.parse(json["kyc_updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "kyc_user_id": kycUserId,
    "kyc_adhar_front": kycAdharFront,
    "kyc_adhar_front_status": kycAdharFrontStatus,
    "kyc_adhar_front_cancel_reason": kycAdharFrontCancelReason,
    "kyc_adhar_back": kycAdharBack,
    "kyc_adhar_back_status": kycAdharBackStatus,
    "kyc_adhar_back_cancel_reason": kycAdharBackCancelReason,
    "kyc_pan_card": kycPanCard,
    "kyc_pan_card_status": kycPanCardStatus,
    "kyc_pan_card_cancel_reason": kycPanCardCancelReason,
    "kyc_status": kycStatus,
    "kyc_created_at": kycCreatedAt?.toIso8601String(),
    "kyc_updated_at": kycUpdatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Userprofile {
  String? id;
  String? profileUserId;
  String? profileMultiImg;
  int? profileStatus;
  int? profileVerifyStatus;
  DateTime? profileCreatedAt;
  DateTime? profileUpdatedAt;
  dynamic profileDeleted;
  int? v;

  Userprofile({
    this.id,
    this.profileUserId,
    this.profileMultiImg,
    this.profileStatus,
    this.profileVerifyStatus,
    this.profileCreatedAt,
    this.profileUpdatedAt,
    this.profileDeleted,
    this.v,
  });

  factory Userprofile.fromJson(Map<String, dynamic> json) => Userprofile(
    id: json["_id"],
    profileUserId: json["profile_user_id"],
    profileMultiImg: json["profile_multi_img"],
    profileStatus: json["profile_status"],
    profileVerifyStatus: json["profile_verify_status"],
    profileCreatedAt: DateTime.parse(json["profile_created_at"]),
    profileUpdatedAt: DateTime.parse(json["profile_updated_at"]),
    profileDeleted: json["profile_deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "profile_user_id": profileUserId,
    "profile_multi_img": profileMultiImg,
    "profile_status": profileStatus,
    "profile_verify_status": profileVerifyStatus,
    "profile_created_at": profileCreatedAt?.toIso8601String(),
    "profile_updated_at": profileUpdatedAt?.toIso8601String(),
    "profile_deleted": profileDeleted,
    "__v": v,
  };
}

