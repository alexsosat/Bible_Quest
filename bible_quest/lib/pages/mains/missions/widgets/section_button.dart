import 'package:bible_quest/bloc/user/missions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SectionButton extends StatelessWidget {
  final int pageIndex;
  final String text;
  final controller = Get.find<MissionsController>();

  SectionButton({
    Key? key,
    required this.pageIndex,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          onPressed: () => controller.changeView(pageIndex),
          child: Text(
            text,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: (controller.currentPage == pageIndex)
                      ? FontWeight.w900
                      : FontWeight.normal,
                  color: (controller.currentPage == pageIndex)
                      ? Theme.of(context).primaryColor
                      : null,
                ),
          )),
    );
  }
}
