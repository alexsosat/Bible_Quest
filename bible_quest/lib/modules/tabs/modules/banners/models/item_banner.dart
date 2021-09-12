import 'dart:convert';

import 'item.dart';

class ItemBanner {
  ItemBanner({
    required this.id,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.items,
    required this.cost,
  });

  int id;
  String title;
  String description;
  double cost;
  DateTime startDate;
  DateTime endDate;
  List<Item> items;

  static List<ItemBanner> listItemBannersFromJson(String str) =>
      List<ItemBanner>.from(
          json.decode(str).map((x) => ItemBanner.fromJson(x)));

  factory ItemBanner.fromJson(Map<String, dynamic> json) => ItemBanner(
        id: json["id"],
        title: json["title"],
        cost: json["cost"].toDouble(),
        description: json["description"],
        startDate: DateTime.parse(json["startDate"]),
        endDate: DateTime.parse(json["endDate"]),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );
}
