class Chapter {
  Chapter({
    required this.id,
    required this.bookId,
    required this.number,
    required this.reference,
  });

  String id;
  String bookId;
  String number;
  String reference;

  factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
        id: json["id"],
        bookId: json["bookId"],
        number: json["number"],
        reference: json["reference"] ?? json["postion"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookId": bookId,
        "number": number,
        "reference": reference,
      };
}
