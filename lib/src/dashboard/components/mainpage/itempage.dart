import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';


class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Future<List<dynamic>> fetchItems() async {
    final httpClient = HttpClient();
    try {
      print("Attempting to connect...");
      final request = await httpClient.getUrl(
          Uri.parse('https://python-mysql-http.onrender.com/items?limit=5&offset=0')
      );
      print("Request created, sending...");
      final response = await request.close();
      print("Response received. Status code: ${response.statusCode}");

      if (response.statusCode == HttpStatus.ok) {
        final jsonString = await response.transform(utf8.decoder).join();
        return json.decode(jsonString);
      } else {
        throw Exception('Failed to load items. Status code: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      print('SocketException: ${e.message}');
      print('OS Error: ${e.osError}');
      rethrow;
    } catch (e) {
      print('Unexpected error: $e');
      rethrow;
    } finally {
      httpClient.close();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No items found'));
          } else {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Description')),
                ],
                rows: snapshot.data!.map((item) => DataRow(
                  cells: [
                    DataCell(Text(item['id'].toString())),
                    DataCell(Text(item['name'])),
                    DataCell(Text(item['description'])),
                  ],
                )).toList(),
              ),
            );
          }
        },
      ),
    );
  }
}
