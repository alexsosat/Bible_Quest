import 'package:bible_quest/app/modules/lectures/controllers/lectures_controller.dart';
import 'package:bible_quest/app/modules/lectures/controllers/read_controller.dart';
import 'package:bible_quest/app/modules/lectures/views/widgets/read_page_icons_icons.dart';
import 'package:bible_quest/app/modules/user/controllers/user_controller.dart';
import 'package:bible_quest/app/modules/user/models/current_reading.dart';
import 'package:bible_quest/globals/user_character.dart';
import 'package:bible_quest/globals/tab_icons_icons.dart';
import 'package:bible_quest/services/storage.dart';
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
  final storage = Storage();
  late CurrentReading currentReading = CurrentReading(
    reference: "",
    chapterProgress: 0,
  );

  late double _value;

  @override
  void dispose() {
    storage.write(
      'curReading',
      currentReading.toJson(),
    );

    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _value = (storage.getStorage.hasData('fontSize')) ? storage.fontSize : 18;

    // Setup the listener.
    _scrollController.addListener(
      () async {
        currentReading.chapterProgress = ((_scrollController.position.pixels /
                    _scrollController.position.maxScrollExtent) *
                100)
            .toInt();
        if (_scrollController.position.atEdge) {
          if (_scrollController.position.pixels == 0) {
            // You're at the top.
          } else {
            // You're at the bottom.

            var userController = Get.find<UserController>();
            var plansController = Get.find<LecturesController>();
            var readController = Get.find<ReadController>();

            Map<String, dynamic>? readedBooks =
                userController.user.currentReadings[0].readed;

            Map<String, dynamic> data =
                readController.isChapterReaded(readedBooks);

            if (!data['isReaded']) {
              plansController.updateReadedBooks(data['books']);
              Map<String, dynamic> growStats =
                  await userController.chapterReward(onLevelUp: _levelUpDialog);
              _showSnackbar(growStats['xp'], growStats['money']);
            }
          }
        }
      },
    );
  }

  _showSnackbar(int xp, double money) {
    Get.snackbar(
      "Bien hecho",
      "Completataste un capítulo más de la Biblia",
      titleText: Text("Bien Hecho"),
      messageText: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Completataste un capítulo más de la Biblia"),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child:
                        Icon(TabIcons.upgrade, color: Colors.lightBlueAccent),
                  ),
                  Text(xp.toString()),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.monetization_on, color: Colors.yellow),
                  ),
                  Text(money.toString()),
                ],
              )
            ],
          )
        ],
      ),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(12),
      duration: Duration(milliseconds: 1500),
    );
  }

  Future _levelUpDialog() async {
    int level = Get.find<UserController>().user.stats.level;
    await Get.dialog(
      AlertDialog(
        title: Text("🎉  Subiste de nivel  🎉"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            UserCharacter(size: 100),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Nv. $level",
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  "→",
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  "Nv. ${++level}",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: Colors.lightBlueAccent),
                )
              ],
            )
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('yay!'),
            style: TextButton.styleFrom(
              backgroundColor: Colors.lightBlueAccent,
              primary: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<ReadController>(
        init: ReadController(chapterId: widget.chapterId),
        builder: (readerController) {
          if (!readerController.isLoading.value) {
            currentReading.reference =
                readerController.content.value.data.reference;
          }
          return Scaffold(
            appBar: AppBar(
              title: (readerController.isLoading.value)
                  ? Text("Cargando")
                  : Text(readerController.content.value.data.reference),
              actions: (!readerController.isLoading.value)
                  ? [
                      IconButton(
                        onPressed: () {
                          if (_value > 18) {
                            storage.write('fontSize', _value - 6);
                            setState(() {
                              _value -= 6;
                            });
                          }
                        },
                        icon: Icon(ReadPageIcons
                            .format_font_size_decrease_icon_136597),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_value < 76) {
                            storage.write('fontSize', _value + 6);
                            setState(() {
                              _value += 6;
                            });
                          }
                        },
                        icon: Icon(ReadPageIcons
                            .format_font_size_increase_icon_137585),
                      ),
                    ]
                  : null,
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
                          child: SelectableText(
                            readerController.content.value.data.content,
                            style: Get.textTheme.subtitle1!.copyWith(
                              height: 1.5,
                              fontSize: _value,
                            ),
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
