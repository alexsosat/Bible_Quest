import 'package:bible_quest/services/translations/supported_locales.dart';

import 'categories.dart';

class Item {
  Item({
    required this.id,
    required this.assetName,
    required this.displayName,
    required this.type,
    required this.description,
    required this.appearRate,
    this.effects,
  });

  int id;
  String assetName;
  String description;
  double appearRate;
  Map<String, dynamic>? effects;
  String displayName;
  ItemCategory type;

  get imagePath =>
      'assets/images/sprites/${ItemCategoryHelpers.categoryToString(this.type)}/${this.assetName}.png';

  factory Item.fromJson(Map<String, dynamic> json) {
    String displayName = BibleQuestLocales.isLocaleSpanish()
        ? json["display_name"]["es"]
        : json["display_name"]["en"];

    String description = BibleQuestLocales.isLocaleSpanish()
        ? json["description"]["es"]
        : json["description"]["en"];

    return Item(
      id: json["id"],
      assetName: json["asset_name"],
      description: description,
      effects: json["effects"],
      displayName: displayName,
      appearRate: json["appear_rate"].toDouble(),
      type: ItemCategoryHelpers.stringToCategory(json["type"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "asset_name": assetName,
        "description": description,
        "effects": effects,
        "display_name": displayName,
        "type": ItemCategoryHelpers.categoryToString(type),
      };
}
