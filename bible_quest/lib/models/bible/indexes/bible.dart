import 'dart:convert';

import 'book.dart';

class Bible {
  Bible({
    required this.books,
  });

  static Bible bibleBooksFromJson(String str) =>
      Bible.fromJson(json.decode(str));

  static String bibleBooksToJson(Bible data) => json.encode(data.toJson());

  List<Book> books;

  factory Bible.fromJson(Map<String, dynamic> json) => Bible(
        books: List<Book>.from(json["data"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(books.map((x) => x.toJson())),
      };

  factory Bible.instance() {
    return Bible(books: <Book>[]);
  }
}
