import 'dart:convert';

import 'package:bible_quest/models/items/item.dart';

import 'stats/stats.dart';

class User {
  User({
    required this.id,
    required this.username,
    required this.stats,
    required this.items,
    this.biography,
    this.booksReaded,
  });

  int id;
  String username;
  String? biography;
  UserStats stats;
  Map<String, dynamic>? booksReaded;

  List<Item> items;

  factory User.instance() => User(
        id: 0,
        username: "",
        items: [],
        stats: UserStats.instance(),
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        biography: json["biography"],
        stats: UserStats(
          level: json["level"],
          currency: json["currency"],
          streak: json["streak"],
          experience: json["experience"],
          health: json["health"],
        ),
        booksReaded: json["books_readed"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "biography": biography,
        "books_readed": jsonEncode(booksReaded!),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      }..addAll(stats.toJson());
}
