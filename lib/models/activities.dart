// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

Activities activitiesFromJson(String str) =>
    Activities.fromJson(json.decode(str));

String activitiesToJson(Activities data) => json.encode(data.toJson());

class Activities {
  Activities({
    this.title,
    this.description,
    this.date,
    this.initialHour,
    this.finishHour,
  });

  String title;
  String description;
  String date;
  String initialHour;
  String finishHour;

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
      title: json["title"],
      description: json["description"],
      date: json["date"],
      initialHour: json["initialHour"],
      finishHour: json["finishHour"]);

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
    "initialHour": initialHour,
    "finishHour": finishHour
  };
}
