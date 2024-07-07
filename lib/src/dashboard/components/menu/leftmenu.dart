import 'package:flutter/material.dart';
import 'menuitem.dart';
import 'menuitemwidget.dart';

// left menu widget
class LeftMenu extends StatelessWidget {
  final List<MenuItem> items;
  final Function(int) onItemSelected;

  LeftMenu(this.items, this.onItemSelected);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: items.asMap().entries.map((entry) {
          int index = entry.key;
          MenuItem item = entry.value;
          return MenuItemWidget(item, index, onItemSelected);
        }).toList(),
      ),
    );
  }
}
