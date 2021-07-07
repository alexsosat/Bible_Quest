import 'chapter_navigation.dart';
import 'meta.dart';

class ChapterContent {
  ChapterContent({
    required this.data,
    required this.meta,
  });

  Data data;
  Meta meta;

  factory ChapterContent.fromJson(Map<String, dynamic> json) => ChapterContent(
        data: Data.fromJson(json["data"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "meta": meta.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.bibleId,
    required this.number,
    required this.bookId,
    required this.reference,
    required this.copyright,
    required this.verseCount,
    required this.content,
    this.next,
    this.previous,
  });

  String id;
  String bibleId;
  String number;
  String bookId;
  String reference;
  String copyright;
  int verseCount;
  String content;
  ChapterNavigation? next;
  ChapterNavigation? previous;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        bibleId: json["bibleId"],
        number: json["number"],
        bookId: json["bookId"],
        reference: json["reference"],
        copyright: json["copyright"],
        verseCount: json["verseCount"],
        content: json["content"],
        next: (json["next"] != null)
            ? ChapterNavigation.fromJson(json["next"])
            : null,
        previous: (json["previous"] != null)
            ? ChapterNavigation.fromJson(json["previous"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bibleId": bibleId,
        "number": number,
        "bookId": bookId,
        "reference": reference,
        "copyright": copyright,
        "verseCount": verseCount,
        "content": content,
        "next": (next != null) ? next!.toJson() : null,
        "previous": (previous != null) ? previous!.toJson() : null,
      };
}
