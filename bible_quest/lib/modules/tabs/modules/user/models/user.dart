import 'dart:convert';

import 'package:bible_quest/modules/tabs/modules/banners/models/categories.dart';
import 'package:bible_quest/modules/tabs/modules/user/models/current_items.dart';
import 'package:bible_quest/modules/tabs/modules/banners/models/item.dart';

import 'stats/complex_stat.dart';
import 'stats/stats.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.stats,
    required this.items,
    required this.currentItems,
    this.biography,
    this.booksReaded,
  });

  int id;
  String username;
  String? biography;
  UserStats stats;
  Map<String, dynamic>? booksReaded;
  CurrentItems currentItems;
  List<Item> items;

  List<Item> itemsfromCategory(ItemCategory category) =>
      items.where((element) => element.type == category).toList();

  factory User.instance() => User(
        id: 0,
        username: "",
        currentItems: CurrentItems.instance(),
        items: [],
        stats: UserStats.instance(),
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        biography: json["biography"],
        stats: UserStats(
          level: json["level"],
          currency: json["currency"].toDouble(),
          streak: json["streak"],
          experience: ComplexStat.fromJson(json["experience"]),
          health: ComplexStat.fromJson(json["health"]),
        ),
        booksReaded: json["books_readed"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        currentItems: CurrentItems.fromJson(json["current_items"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "biography": biography,
        "books_readed": jsonEncode(booksReaded!),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "current_items": currentItems.toJson(),
      }..addAll(stats.toJson());
}
