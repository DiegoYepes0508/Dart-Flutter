// To parse this JSON data, do
//
//     final postRespuesta = postRespuestaFromJson(jsonString);

import 'dart:convert';

List<PostRespuesta> postRespuestaFromJson(String str) =>
    List<PostRespuesta>.from(
        json.decode(str).map((x) => PostRespuesta.fromJson(x)));

String postRespuestaToJson(List<PostRespuesta> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostRespuesta {
  PostRespuesta({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory PostRespuesta.fromJson(Map<String, dynamic> json) => PostRespuesta(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
