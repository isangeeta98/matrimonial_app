// To parse this JSON data, do
//
//     final termandconditionresmodel = termandconditionresmodelFromJson(jsonString);

import 'dart:convert';

Termandconditionresmodel termandconditionresmodelFromJson(String str) => Termandconditionresmodel.fromJson(json.decode(str));

String termandconditionresmodelToJson(Termandconditionresmodel data) => json.encode(data.toJson());

class Termandconditionresmodel {
  Termandconditionresmodel({
     this.status,
     this.data,
  });

  int? status;
  Data? data;

  factory Termandconditionresmodel.fromJson(Map<String, dynamic> json) => Termandconditionresmodel(
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.id,
    this.termsDescription,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? id;
  String? termsDescription;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    termsDescription: json["terms_description"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "terms_description": termsDescription,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
