import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MissionsController extends ControllerTemplate {
  final controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  onInit() {
    fetchMissions();
    super.onInit();
  }

  @override
  refreshContent() {
    fetchMissions();
    super.refreshContent();
  }

  void fetchMissions() async {
    try {
      isLoading(true);
    } finally {
      isLoading(false);
    }
  }

  void changeView(int pageIndex) async {
    currentPage = pageIndex;
    update();
    await controller.animateToPage(
      pageIndex,
      curve: Curves.ease,
      duration: Duration(milliseconds: 500),
    );
  }
}
