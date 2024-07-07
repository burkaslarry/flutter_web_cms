import 'package:flutter/material.dart';
import 'menuitem.dart';

class MenuItemWidget extends StatelessWidget {
  final MenuItem item;
  final int index;
  final Function(int) onItemSelected;

  const MenuItemWidget(this.item, this.index, this.onItemSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(item.icon),
      title: Text(item.title),
      onTap: () {
        onItemSelected(index);
      },
    );
  }
}
