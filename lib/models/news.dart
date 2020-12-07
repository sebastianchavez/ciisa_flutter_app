// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

News newsFromJson(String str) => News.fromJson(json.decode(str));

String newsToJson(News data) => json.encode(data.toJson());

class News {
  News({
    this.image,
    this.title,
    this.description,
  });

  String image;
  String title;
  String description;

  factory News.fromJson(Map<String, dynamic> json) => News(
      image: json["image"],
      title: json["title"],
      description: json["description"]);

  Map<String, dynamic> toJson() =>
      {"image": image, "title": title, "description": description};
}
