import 'package:flutter/material.dart';

class NavigationBuilder<T> extends StatelessWidget {
  final List<T> values;
  final List<Widget> pages;
  final T currentValue;
  final Function(T newValue)? willPopScope;

  const NavigationBuilder({
    Key? key,
    required this.values,
    required this.pages,
    required this.currentValue,
    this.willPopScope,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int index = values.indexOf(currentValue);

    if (willPopScope == null) {
      return pages[index];
    } else {
      return WillPopScope(
        onWillPop: () async {
          if (index > 0) {
            this.willPopScope!(values[index - 1]);
          } else {
            // Get.find<NavigationController>()
            //     .drawerKey
            //     .currentState!
            //     .openDrawer();
          }
          return false;
        },
        child: pages[index],
      );
    }
  }
}
