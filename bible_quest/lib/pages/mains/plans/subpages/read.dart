import 'package:bible_quest/bloc/bible/plan.dart';
import 'package:bible_quest/bloc/bible/read.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  final storage = GetStorage();

  @override
  void initState() {
    super.initState();

    // Setup the listener.
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
        } else {
          // You're at the bottom.

          Map<String, dynamic>? readedBooks = storage.read('bible_readed');
          final bookData = Get.find<ReadController>().content.value.data;

          if (readedBooks != null) {
            if (readedBooks.containsKey(bookData.bookId)) {
              if (!readedBooks[bookData.bookId].contains(bookData.id)) {
                readedBooks[bookData.bookId].add(bookData.id);
                _showSnackbar();
              }
            } else {
              readedBooks[bookData.bookId] = [bookData.id];
              _showSnackbar();
            }
          } else {
            readedBooks = {
              bookData.bookId: [bookData.id],
            };
            _showSnackbar();
          }

          storage.write('bible_readed', readedBooks);
          Get.find<PlansController>().refreshContent();
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
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: FloatingActionButton(
                            heroTag: null,
                            onPressed: () {
                              print(storage.read('bible_readed'));
                              //storage.remove('bible_readed');
                            },
                            backgroundColor: Colors.grey[850],
                            elevation: 0,
                            child: Icon(Icons.add),
                          ),
                        ),
                      )
                    ],
                  ),
          );
        });
  }
}
