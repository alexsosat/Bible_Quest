// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/banners/models/item.dart';

import 'current_items.dart';
import 'stats/stats.dart';

class User {
  User({
    required this.key,
    required this.username,
    required this.currentItems,
    required this.stats,
    required this.currentReadings,
    required this.items,
  });

  String key;
  String username;
  CurrentItems currentItems;
  Stats stats;
  List<CurrentReading> currentReadings;
  List<Item> items;

  static User userFromJson(String str) => User.fromJson(json.decode(str));

  String userToJson(User data) => json.encode(data.toJson());

  List<Item> itemsfromCategory(ItemCategory category) =>
      items.where((element) => element.type == category).toList();

  factory User.fromJson(Map<String, dynamic> json) => User(
        key: json["key"],
        username: json["username"],
        currentItems: CurrentItems.fromJson(json["current_items"]),
        stats: Stats.fromJson(json["stats"]),
        currentReadings: List<CurrentReading>.from(
            json["current_readings"].map((x) => CurrentReading.fromJson(x))),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "key": key,
        "username": username,
        "current_items": currentItems.toJson(),
        "stats": stats.toJson(),
        "current_readings":
            List<dynamic>.from(currentReadings.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x)),
      };
}

class CurrentReading {
  CurrentReading({
    this.readed,
    required this.planName,
  });

  Map<String, dynamic>? readed;
  String planName;

  factory CurrentReading.fromJson(Map<String, dynamic> json) => CurrentReading(
        readed: json["readed"],
        planName: json["plan_name"],
      );

  Map<String, dynamic> toJson() => {
        "readed": readed,
        "plan_name": planName,
      };
}
