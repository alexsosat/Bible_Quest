import 'package:bible_quest/app/modules/banners/models/categories.dart';
import 'package:bible_quest/app/modules/banners/models/item.dart';

class StartItems{
  static List<Item> heads = [
    Item(id: 0, assetName: "tile026", displayName: "hair 1", type: ItemCategory.head, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile028", displayName: "hair 2", type: ItemCategory.head, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile030", displayName: "hair 3", type: ItemCategory.head, description: "", appearRate: 1.0),
  ];

  static List<Item> bodies = [
    Item(id: 0, assetName: "tile064", displayName: "body 1", type: ItemCategory.body, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile066", displayName: "body 2", type: ItemCategory.body, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile068", displayName: "body 3", type: ItemCategory.body, description: "", appearRate: 1.0),
  ];

  static List<Item> base = [
    Item(id: 0, assetName: "tile007", displayName: "skin 1", type: ItemCategory.base, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile008", displayName: "skin 2", type: ItemCategory.base, description: "", appearRate: 1.0),
    Item(id: 0, assetName: "tile011", displayName: "skin 3", type: ItemCategory.base, description: "", appearRate: 1.0),
  ];
}