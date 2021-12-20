class ChapterNavigation {
  ChapterNavigation({
    required this.id,
    required this.number,
    required this.bookId,
  });

  String id;
  String number;
  String bookId;

  factory ChapterNavigation.fromJson(Map<String, dynamic> json) =>
      ChapterNavigation(
        id: json["id"],
        number: json["number"],
        bookId: json["bookId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "number": number,
        "bookId": bookId,
      };
}
