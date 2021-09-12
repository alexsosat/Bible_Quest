import 'package:bible_quest/modules/tabs/modules/banners/models/categories.dart';

class CurrentItems {
  CurrentItems({
    required this.head,
    required this.body,
    required this.base,
    this.arm,
    this.background,
    this.pet,
  });

  String base;
  String head;
  String body;
  String? arm;
  String? background;
  String? pet;

  factory CurrentItems.instance() =>
      CurrentItems(head: "tile023", body: "tile055", base: "tile007");

  String? categoryToItem(ItemCategory category) {
    switch (category) {
      case ItemCategory.arm:
        return this.arm;
      case ItemCategory.background:
        return this.background;
      case ItemCategory.base:
        return this.base;
      case ItemCategory.body:
        return this.body;
      case ItemCategory.head:
        return this.head;
      case ItemCategory.pet:
        return this.pet;
    }
  }

  CurrentItems get stringtoImagePath {
    final basePath = 'assets/images/sprites';

    return CurrentItems(
      base: "$basePath/base/${this.base}.png",
      head: "$basePath/head/${this.head}.png",
      body: "$basePath/body/${this.body}.png",
      arm: (this.arm != null && this.arm!.isNotEmpty)
          ? "$basePath/arm/${this.arm}.png"
          : null,
      background: (this.background != null && this.background!.isNotEmpty)
          ? "$basePath/background/${this.background}.png"
          : null,
      pet: (this.pet != null && this.pet!.isNotEmpty)
          ? "$basePath/pet/${this.pet}.png"
          : null,
    );
  }

  factory CurrentItems.fromJson(Map<String, dynamic> json) => CurrentItems(
        head: json["head"],
        body: json["body"],
        arm: json["arm"],
        background: json["background"],
        pet: json["pet"],
        base: json["base"],
      );

  Map<String, dynamic> toJson() => {
        "head": head,
        "body": body,
        "arm": arm,
        "background": background,
        "pet": pet,
        "base": base,
      };
}
