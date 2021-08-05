import 'categories.dart';

class Item {
  Item({
    required this.id,
    required this.assetName,
    required this.cost,
    required this.displayName,
    required this.type,
    required this.description,
    this.effects,
  });

  int id;
  String assetName;
  String description;
  int cost;
  Map<String, dynamic>? effects;
  String displayName;
  ItemCategory type;

  get imagePath =>
      'assets/images/sprites/${ItemCategoryHelpers.categoryToString(this.type)}/${this.assetName}.png';

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        assetName: json["asset_name"],
        description: json["description"],
        cost: json["cost"],
        effects: json["effects"],
        displayName: json["display_name"],
        type: ItemCategoryHelpers.stringToCategory(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "asset_name": assetName,
        "description": description,
        "cost": cost,
        "effects": effects,
        "display_name": displayName,
        "type": ItemCategoryHelpers.categoryToString(type),
      };
}
