import 'package:bible_quest/bloc/bible/plan.dart';
import 'package:bible_quest/bloc/bible/read.dart';
import 'package:bible_quest/bloc/user/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadPage extends StatefulWidget {
  final String chapterId;

  const ReadPage({
    Key? key,
    required this.chapterId,
  }) : super(key: key);

  @override
  _ReadPageState createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _scrollController.addListener(() async {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          // You're at the bottom.

          var userController = Get.find<UserController>();
          var plansController = Get.find<PlansController>();
          var readController = Get.find<ReadController>();

          Map<String, dynamic>? readedBooks = userController.user.booksReaded;

          Map<String, dynamic> data =
              readController.isChapterReaded(readedBooks);

          if (!data['isReaded']) {
            plansController.updateReadedBooks(data['books']);
            userController.chapterReward();
            _showSnackbar();
          }
        }
      }
    });
  }

  _showSnackbar() {
    Get.snackbar(
      "Bien hecho",
      "Completataste un capítulo más de la Biblia",
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ReadController>(
        init: ReadController(chapterId: widget.chapterId),
        builder: (readerController) {
          return Scaffold(
            appBar: AppBar(
              title: (readerController.isLoading.value)
                  ? Text("Cargando")
                  : Text(readerController.content.value.data.reference),
            ),
            body: (readerController.isLoading.value)
                ? Center(child: CircularProgressIndicator())
                : Stack(
                    children: [
                      RawScrollbar(
                        controller: _scrollController,
                        thumbColor: Colors.grey[600],
                        radius: Radius.circular(20),
                        thickness: 5,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding:
                              EdgeInsets.only(top: 20, left: 10, right: 10),
                          child: Text(
                            readerController.content.value.data.content,
                            style:
                                Get.textTheme.subtitle1!.copyWith(height: 1.5),
                          ),
                        ),
                      ),
                    ],
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: (readerController.isLoading.value)
                ? Container()
                : Stack(
                    alignment: Alignment.bottomCenter,
                    children: <Widget>[
                      (readerController.content.value.data.previous != null)
                          ? Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FloatingActionButton(
                                  heroTag: null,
                                  onPressed: () => readerController
                                      .changeChapter(readerController
                                          .content.value.data.previous!.id),
                                  backgroundColor: Colors.grey[850],
                                  elevation: 0,
                                  child: Icon(Icons.arrow_back),
                                ),
                              ),
                            )
                          : Container(),
                      (readerController.content.value.data.next != null)
                          ? Align(
                              alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: FloatingActionButton(
                                  heroTag: null,
                                  onPressed: () => readerController
                                      .changeChapter(readerController
                                          .content.value.data.next!.id),
                                  backgroundColor: Colors.grey[850],
                                  elevation: 0,
                                  child: Icon(Icons.arrow_forward),
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
          );
        });
  }
}
