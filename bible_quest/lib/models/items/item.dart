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
      'assets/images/sprites/${_categoryToString(this.type)}/${this.assetName}.png';

  static ItemCategory _stringToCategory(String value) {
    switch (value) {
      case "head":
        return ItemCategory.head;
      case "arms":
        return ItemCategory.arms;
      case "body":
        return ItemCategory.body;
      case "pet":
        return ItemCategory.pet;
      case "background":
        return ItemCategory.background;
      case "base":
        return ItemCategory.base;
      default:
        return ItemCategory.base;
    }
  }

  static String _categoryToString(ItemCategory value) {
    switch (value) {
      case ItemCategory.head:
        return "head";
      case ItemCategory.arms:
        return "arms";
      case ItemCategory.body:
        return "body";
      case ItemCategory.pet:
        return "pet";
      case ItemCategory.background:
        return "background";
      case ItemCategory.base:
        return "base";
      default:
        return "base";
    }
  }

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        assetName: json["asset_name"],
        description: json["description"],
        cost: json["cost"],
        effects: json["effects"],
        displayName: json["display_name"],
        type: _stringToCategory(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "asset_name": assetName,
        "description": description,
        "cost": cost,
        "effects": effects,
        "display_name": displayName,
        "type": _categoryToString(type),
      };
}

enum ItemCategory {
  head,
  arms,
  body,
  background,
  pet,
  base,
}
