import 'book.dart';

class Bible {
  Bible({
    required this.books,
  });

  List<Book> books;

  int get finishedBooksCount {
    int count = 0;
    books.forEach((book) {
      if (book.readedChapters == book.totalChapters) {
        count++;
      }
    });
    return count;
  }

  factory Bible.fromJson(
          Map<String, dynamic> json, Map<String, dynamic>? userData) =>
      Bible(
        books: List<Book>.from(
            json["data"].map((x) => Book.fromJson(x, userData))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(books.map((x) => x.toJson())),
      };

  factory Bible.instance() {
    return Bible(books: <Book>[]);
  }
}
