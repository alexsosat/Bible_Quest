// To parse this JSON data, do
//
//     final userReadings = userReadingsFromJson(jsonString);

import 'dart:convert';

class UserReadings {
  UserReadings({
    this.readed,
    required this.planName,
  });

  Map<String, dynamic>? readed;
  String planName;

  static List<UserReadings> userReadingsFromJson(String str) =>
      List<UserReadings>.from(
          json.decode(str).map((x) => UserReadings.fromJson(x)));

  factory UserReadings.fromJson(Map<String, dynamic> json) => UserReadings(
        readed: json["readed"],
        planName: json["plan_name"],
      );

  Map<String, dynamic> toJson() => {
        "readed": readed,
        "plan_name": planName,
      };
}
