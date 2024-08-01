import 'package:flutter/material.dart';

class NavBarUtls {
  static const List<String> name = [
    'DASHBOARD',
    'CATEGORY',
    'HELP',
    'LOGOUT',
  ];

  static const List<IconData> icons = [
    Icons.home,
    Icons.category_outlined,
    Icons.help,
    Icons.logout,
  ];
}

List<String> getSubMenuItems(String itemName) {
  switch (itemName) {
    case 'CATEGORY':
      return ['Add Category', 'All Category'];

    default:
      return [];
  }
}
