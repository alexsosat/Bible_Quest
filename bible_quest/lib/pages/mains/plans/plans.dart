import 'package:bible_quest/bloc/navigation.dart';
import 'package:bible_quest/globals/tab_page.dart';
import 'package:bible_quest/pages/mains/plans/subpages/books/books.dart';
import 'package:bible_quest/pages/mains/plans/widgets/round_plan_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PlansPage extends StatelessWidget {
  const PlansPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
      child: TabPage(
        children: <Widget>[
          PlanTile(
            title: "Antiguo Testamento",
            totalBooks: 12,
            readedBooks: 1,
            onPressed: () {
              Get.find<NavigationController>()
                  .goToSubTabView(BooksPage(), context);
            },
          ),
          PlanTile(
            title: "Nuevo Testamento",
            totalBooks: 24,
            readedBooks: 2,
          ),
          PlanTile(
            title: "Planes",
            totalBooks: 6,
            readedBooks: 3,
          ),
        ],
      ),
    );
  }
}
