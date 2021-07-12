import 'package:bible_quest/bloc/plans/read.dart';
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
    _scrollController.addListener(() {
      if (_scrollController.position.atEdge) {
        if (_scrollController.position.pixels == 0) {
          // You're at the top.
          print("top");
        } else {
          // You're at the bottom.
          print("bottom");
        }
      }
    });
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
                        thumbColor: Colors.redAccent,
                        radius: Radius.circular(20),
                        thickness: 5,
                        child: SingleChildScrollView(
                          controller: _scrollController,
                          padding: EdgeInsets.only(top: 20),
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
                                  onPressed: () async {
                                    await Get.delete<ReadController>();
                                    Get.off(
                                      () => ReadPage(
                                        chapterId: readerController
                                            .content.value.data.previous!.id,
                                      ),
                                      preventDuplicates: false,
                                    );
                                  },
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
                                  onPressed: () async {
                                    await Get.delete<ReadController>();
                                    Get.off(
                                      () => ReadPage(
                                        chapterId: readerController
                                            .content.value.data.next!.id,
                                      ),
                                      preventDuplicates: false,
                                    );
                                  },
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
