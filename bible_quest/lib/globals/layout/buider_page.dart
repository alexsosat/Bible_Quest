import 'package:bible_quest/bloc/abstract_model.dart';
import 'package:bible_quest/pages/tabs/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuilderPage<T extends ControllerTemplate> extends StatelessWidget {
  final List<Widget> Function(T controller) children;
  final T controller;
  final double topSpace;
  final double bottomSpace;
  final double horizontalPadding;
  final ScrollPhysics scrollPhysics;

  const BuilderPage({
    Key? key,
    required this.children,
    required this.controller,
    this.scrollPhysics = const BouncingScrollPhysics(),
    this.topSpace = 150,
    this.bottomSpace = 95,
    this.horizontalPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GetBuilder<T>(
            init: controller,
            builder: (_) {
              if (_.isLoading.value)
                return Center(child: CircularProgressIndicator());
              return ListView(
                physics: scrollPhysics,
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                children: _pageBody(controller),
              );
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: BibleQuestAppBar(),
          ),
        ],
      ),
    );
  }

  _pageBody(T controller) {
    return <Widget>[
      SizedBox(height: topSpace),
      ...children(controller),
      SizedBox(height: bottomSpace),
    ];
  }
}
