import 'package:flutter/material.dart';
import 'menuitem.dart';
import 'menuitemwidget.dart';

//left menu widget
class LeftMenu extends StatelessWidget {
  final List<MenuItem> items;

  LeftMenu(this.items);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: items.map((item) {
          return MenuItemWidget(item);
        }).toList(),
      ),
    );
  }
}
