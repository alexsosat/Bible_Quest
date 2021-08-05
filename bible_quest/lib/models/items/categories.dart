enum ItemCategory {
  head,
  arm,
  body,
  background,
  pet,
  base,
}

class ItemCategoryHelpers {
  static ItemCategory stringToCategory(String value) {
    switch (value) {
      case "head":
        return ItemCategory.head;
      case "arm":
        return ItemCategory.arm;
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

  static String categoryToString(ItemCategory value) {
    switch (value) {
      case ItemCategory.head:
        return "head";
      case ItemCategory.arm:
        return "arm";
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
}
