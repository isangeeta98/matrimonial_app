// To parse this JSON data, do
//
//     final faqresponsemodel = faqresponsemodelFromJson(jsonString);

import 'dart:convert';

Faqresponsemodel faqresponsemodelFromJson(String str) => Faqresponsemodel.fromJson(json.decode(str));

String faqresponsemodelToJson(Faqresponsemodel data) => json.encode(data.toJson());

class Faqresponsemodel {
  Faqresponsemodel({
    this.post,
    this.pageToken,
    this.totalPages,
    this.currentPage,
    this.prevPage,
  });

  List<Post>? post;
  dynamic pageToken;
  int? totalPages;
  int? currentPage;
  dynamic prevPage;

  factory Faqresponsemodel.fromJson(Map<String, dynamic> json) => Faqresponsemodel(
    post: List<Post>.from(json["post"].map((x) => Post.fromJson(x))),
    pageToken: json["pageToken"],
    totalPages: json["totalPages"],
    currentPage: json["currentPage"],
    prevPage: json["prevPage"],
  );

  Map<String, dynamic> toJson() => {
    "post": List<dynamic>.from(post!.map((x) => x.toJson())),
    "pageToken": pageToken,
    "totalPages": totalPages,
    "currentPage": currentPage,
    "prevPage": prevPage,
  };
}

class Post {
  Post({
    this.id,
    this.question,
    this.answer,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deleted,
    this.v,
  });

  String? id;
  String? question;
  String? answer;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deleted;
  int? v;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    id: json["_id"],
    question: json["question"],
    answer: json["answer"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deleted: json["deleted"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "question": question,
    "answer": answer,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "deleted": deleted,
    "__v": v,
  };
}
