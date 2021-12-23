import 'package:bible_quest/app/modules/activities/lectures/navigation/models/bible/content/chapter_content.dart';
import 'package:bible_quest/app/modules/activities/lectures/navigation/providers/bible_provider.dart';
import 'package:get/get.dart';

class ReadController extends GetxController {
  String chapterId;
  var isLoading = true.obs;
  ReadController({required this.chapterId});

  var content = ChapterContent.instance().obs;

  @override
  onInit() {
    fetchChapter();
    super.onInit();
  }

  refreshContent() {
    fetchChapter();
  }

  changeChapter(String id) {
    chapterId = id;
    fetchChapter();
  }

  void fetchChapter() async {
    try {
      isLoading(true);
      var response = await BibleProvider().getChapter(chapterId);
      content(response);
    } finally {
      isLoading(false);
    }
  }

  bool isChapterReaded(Map<String, dynamic>? readedBooks) {
    final bookData = content.value.data;

    if (readedBooks != null) {
      if (readedBooks.containsKey(bookData.bookId)) {
        if (!readedBooks[bookData.bookId].contains(bookData.id)) {
          readedBooks[bookData.bookId].add(bookData.id);
          return false;
        }
      } else {
        readedBooks[bookData.bookId] = [bookData.id];
        return false;
      }
    } else {
      readedBooks = {
        bookData.bookId: [bookData.id],
      };
      return false;
    }

    return true;
  }
}
