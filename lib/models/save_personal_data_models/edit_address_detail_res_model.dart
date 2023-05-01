// To parse this JSON data, do
//
//     final addressDetailResModel = addressDetailResModelFromJson(jsonString);

import 'dart:convert';

AddressDetailResModel addressDetailResModelFromJson(String str) => AddressDetailResModel.fromJson(json.decode(str));

String addressDetailResModelToJson(AddressDetailResModel data) => json.encode(data.toJson());

class AddressDetailResModel {
  AddressDetailResModel({
    this.status,
    this.data,
    this.message,
  });

  int? status;
  Data? data;
  String? message;

  factory AddressDetailResModel.fromJson(Map<String, dynamic> json) => AddressDetailResModel(
    status: json["status"],
    //data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    //"data": data?.toJson(),
    "message": message,
  };
}

class Data {
  Data({
    required this.aUserId,
    required this.aCountry,
    required this.aState,
    required this.aCity,
    required this.aAddress,
    required this.aSameAddress,
    required this.aPCountry,
    required this.aPState,
    required this.aPCity,
    required this.aPAddress,
  });

  String aUserId;
  String aCountry;
  String aState;
  String aCity;
  String aAddress;
  String aSameAddress;
  String aPCountry;
  String aPState;
  String aPCity;
  String aPAddress;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
  );

  Map<String, dynamic> toJson() => {
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
  };
}
