import 'dart:convert';

import 'package:bible_quest/services/translations/supported_locales.dart';

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
  String? description;
  double cost;
  DateTime startDate;
  DateTime endDate;
  List<Item>? items;

  static List<ItemBanner> listItemBannersFromJson(String str) =>
      List<ItemBanner>.from(
          json.decode(str).map((x) => ItemBanner.fromJson(x)));

  factory ItemBanner.fromJson(Map<String, dynamic> json) {
    String? description;

    String title = BibleQuestLocales.isLocaleSpanish()
        ? json["title"]["es"]
        : json["title"]["en"];

    if (json["description"] != null)
      description = BibleQuestLocales.isLocaleSpanish()
          ? json["description"]["es"]
          : json["description"]["en"];

    return ItemBanner(
      id: json["id"],
      title: title,
      cost: json["cost"].toDouble(),
      description: description,
      startDate: DateTime.parse(json["start_date"]),
      endDate: DateTime.parse(json["end_date"]),
      items: json["items"] != null
          ? List<Item>.from(json["items"].map((x) => Item.fromJson(x)))
          : null,
    );
  }
}
