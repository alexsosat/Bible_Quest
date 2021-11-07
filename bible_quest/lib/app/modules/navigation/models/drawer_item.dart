import 'package:flutter/material.dart';

import 'views_enum.dart';

class DrawerItem {
  final IconData icon;
  final String title;
  final DrawerViews view;

  DrawerItem({
    required this.icon,
    required this.title,
    required this.view,
  });
}
