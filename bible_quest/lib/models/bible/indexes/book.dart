import 'chapter.dart';

class Book {
  Book({
    required this.id,
    required this.abbreviation,
    required this.name,
    required this.nameLong,
    required this.totalChapters,
    required this.readedChapters,
    required this.chapters,
  });

  String id;
  String abbreviation;
  String name;
  String nameLong;
  int readedChapters;
  int totalChapters;
  List<Chapter> chapters;

  factory Book.fromJson(
          Map<String, dynamic> json, Map<String, dynamic> userData) =>
      Book(
        id: json["id"],
        abbreviation: json["abbreviation"],
        name: json["name"],
        nameLong: json["nameLong"],
        totalChapters: json["chapters"].length,
        readedChapters:
            (userData[json["id"]] != null) ? userData[json["id"]].length : 0,
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x, userData))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "name": name,
        "nameLong": nameLong,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}
