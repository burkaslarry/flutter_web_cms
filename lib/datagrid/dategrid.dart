//dashboard.dart

import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: _buildDrawer(context), body: _buildDashboardBody(context));
  }

  Widget _buildDrawer(BuildContext context) {
    //return left menu
    var iconsData = [
      //icon data
    ];

    return Drawer(
      child: ListView(
        children: iconsData.map((icon) {
          return ListTile(
            leading: icon,
            title: Text('Title'),
            onTap: () => Navigator.pop(context),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDashboardBody() {
    //return data grid
    return Column(
      children: [
        //Search bar
        TextField(),

        //Data grid
        Expanded(
            child: DataTable(columns: [
          //columns
        ], rows: [
          //rows
        ]))
      ],
    );
  }
}
