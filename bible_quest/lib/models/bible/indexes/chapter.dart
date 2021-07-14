class Chapter {
  Chapter({
    required this.id,
    required this.bookId,
    required this.number,
    required this.reference,
    required this.readed,
  });

  String id;
  String bookId;
  String number;
  String reference;
  bool readed;

  factory Chapter.fromJson(
          Map<String, dynamic> json, Map<String, dynamic>? userData) =>
      Chapter(
        id: json["id"],
        bookId: json["bookId"],
        number: json["number"],
        readed: (userData?[json["bookId"]] != null)
            ? userData![json["bookId"]].contains(json["id"])
            : false,
        reference: json["reference"] ?? json["postion"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "bookId": bookId,
        "number": number,
        "reference": reference,
      };
}
