// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

DefaultResponse responseFromJson(String str) =>
    DefaultResponse.fromJson(json.decode(str));

String responseToJson(DefaultResponse data) => json.encode(data.toJson());

class DefaultResponse {
  DefaultResponse({
    this.ok,
    this.data,
    this.message,
  });

  bool ok;
  List data;
  String message;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      DefaultResponse(
          ok: json["ok"], message: json["message"], data: json["data"]);

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "message": message,
        "data": data,
      };
}
