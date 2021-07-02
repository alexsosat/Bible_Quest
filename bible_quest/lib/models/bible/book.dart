import 'chapter.dart';

class Book {
  Book({
    required this.id,
    required this.abbreviation,
    required this.name,
    required this.nameLong,
    required this.chapters,
  });

  String id;
  String abbreviation;
  String name;
  String nameLong;
  List<Chapter> chapters;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        id: json["id"],
        abbreviation: json["abbreviation"],
        name: json["name"],
        nameLong: json["nameLong"],
        chapters: List<Chapter>.from(
            json["chapters"].map((x) => Chapter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "abbreviation": abbreviation,
        "name": name,
        "nameLong": nameLong,
        "chapters": List<dynamic>.from(chapters.map((x) => x.toJson())),
      };
}
