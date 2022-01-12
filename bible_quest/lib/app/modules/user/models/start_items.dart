import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/banners/models/item.dart';

class StartItems {
  static Item outline = Item(
      id: 0,
      assetName: "tile006",
      displayName: "outline",
      type: ItemCategory.base,
      description: "",
      appearRate: 1.0);

  static Item shirtOutline = Item(
      id: 0,
      assetName: "tile007",
      displayName: "outline",
      type: ItemCategory.base,
      description: "",
      appearRate: 1.0);

  static List<Item> heads = [
    Item(
        id: 0,
        assetName: "tile013",
        displayName: "hair 1",
        type: ItemCategory.head,
        description: "",
        appearRate: 1.0),
    Item(
        id: 1,
        assetName: "tile014",
        displayName: "hair 2",
        type: ItemCategory.head,
        description: "",
        appearRate: 1.0),
  ];

  static List<Item> bodies = [
    Item(
        id: 0,
        assetName: "tile020",
        displayName: "body 1",
        type: ItemCategory.body,
        description: "",
        appearRate: 1.0),
  ];

  static List<Item> base = [
    Item(
        id: 0,
        assetName: "tile001",
        displayName: "skin 1",
        type: ItemCategory.base,
        description: "",
        appearRate: 1.0),
    Item(
        id: 1,
        assetName: "tile002",
        displayName: "skin 2",
        type: ItemCategory.base,
        description: "",
        appearRate: 1.0),
    Item(
        id: 2,
        assetName: "tile003",
        displayName: "skin 3",
        type: ItemCategory.base,
        description: "",
        appearRate: 1.0),
    Item(
        id: 3,
        assetName: "tile004",
        displayName: "skin 4",
        type: ItemCategory.base,
        description: "",
        appearRate: 1.0),
  ];
}
