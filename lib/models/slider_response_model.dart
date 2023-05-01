// To parse this JSON data, do
//
//     final sliderResponseModel = sliderResponseModelFromJson(jsonString);

import 'dart:convert';

SliderResponseModel sliderResponseModelFromJson(String str) => SliderResponseModel.fromJson(json.decode(str));

String sliderResponseModelToJson(SliderResponseModel data) => json.encode(data.toJson());

class SliderResponseModel {
  SliderResponseModel({
    this.data,
    this.pageToken,
    this.totalPages,
    this.currentPage,
    this.prevPage,
  });

  List<SliderData>? data;
  int? pageToken;
  int? totalPages;
  int? currentPage;
  dynamic prevPage;

  factory SliderResponseModel.fromJson(Map<String, dynamic> json) => SliderResponseModel(
    data: List<SliderData>.from(json["data"].map((x) => SliderData.fromJson(x))),
    pageToken: json["pageToken"],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    prevPage: json["prevPage"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "pageToken": pageToken,
    "totalPages": totalPages,
    "currentPage": currentPage,
    "prevPage": prevPage,
  };
}

class SliderData {
  SliderData({
    this.id,
    this.sTitle,
    this.sDescription,
    this.sImg,
    this.sCreatedAt,
    this.sUpdatedAt,
    this.sDeleted,
    this.sStatus,
    this.v,
  });

  String? id;
  String? sTitle;
  String? sDescription;
  String? sImg;
  DateTime? sCreatedAt;
  DateTime? sUpdatedAt;
  bool? sDeleted;
  int? sStatus;
  int? v;

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    id: json["_id"],
    sTitle: json["s_title"],
    sDescription: json["s_description"],
    sImg: json["s_img"],
    sCreatedAt: DateTime.parse(json["s_created_at"]),
    sUpdatedAt: DateTime.parse(json["s_updated_at"]),
    sDeleted: json["s_deleted"],
    sStatus: json["s_status"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "s_title": sTitle,
    "s_description": sDescription,
    "s_img": sImg,
    "s_created_at": sCreatedAt?.toIso8601String(),
    "s_updated_at": sUpdatedAt?.toIso8601String(),
    "s_deleted": sDeleted,
    "s_status": sStatus,
    "__v": v,
  };
}
