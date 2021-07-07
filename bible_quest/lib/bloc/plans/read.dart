import 'package:bible_quest/api/bible/fetch_bible.dart';
import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:get/get.dart';

class ReadController extends ControllerTemplate {
  final chapterId;
  ReadController({required this.chapterId});

  var content = "".obs;

  @override
  onInit() {
    fetchChapter();
    super.onInit();
  }

  void fetchChapter() async {
    try {
      isLoading(true);
      var response = await ApiBibleService().getChapter(chapterId);
      content(response.data.content);
    } finally {
      isLoading(false);
    }
  }
}
