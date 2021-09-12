import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:bible_quest/modules/tabs/modules/lectures/models/bible/content/chapter_content.dart';
import 'package:bible_quest/modules/tabs/modules/lectures/providers/fetch_bible.dart';
import 'package:get/get.dart';

class ReadController extends ControllerTemplate {
  String chapterId;
  ReadController({required this.chapterId});

  var content = ChapterContent.instance().obs;

  @override
  onInit() {
    fetchChapter();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchChapter();
    super.refreshContent();
  }

  changeChapter(String id) {
    chapterId = id;
    fetchChapter();
  }

  void fetchChapter() async {
    try {
      isLoading(true);
      var response = await ApiBibleService().getChapter(chapterId);
      content(response);
    } finally {
      isLoading(false);
    }
  }

  Map<String, dynamic> isChapterReaded(Map<String, dynamic>? readedBooks) {
    final bookData = content.value.data;

    if (readedBooks != null) {
      if (readedBooks.containsKey(bookData.bookId)) {
        if (!readedBooks[bookData.bookId].contains(bookData.id)) {
          readedBooks[bookData.bookId].add(bookData.id);
          return {
            'isReaded': false,
            'books': readedBooks,
          };
        }
      } else {
        readedBooks[bookData.bookId] = [bookData.id];
        return {
          'isReaded': false,
          'books': readedBooks,
        };
      }
    } else {
      readedBooks = {
        bookData.bookId: [bookData.id],
      };
      return {
        'isReaded': false,
        'books': readedBooks,
      };
    }

    return {
      'isReaded': true,
      'books': readedBooks,
    };
  }
}
