import 'dart:convert';

import 'package:catlog/models/catlog.dart';
import 'package:catlog/widgets/drawer.dart';
import 'package:catlog/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadJSONData();
  }

  loadJSONData() async {
    await Future.delayed(Duration(seconds: 2));
    final catlogJSON = await rootBundle.loadString('assets/files/catlog.json');
    final decodedData = jsonDecode(catlogJSON);
    var productsData = decodedData['products'];
    CatlogModel.items = List.from(productsData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Catlog',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatlogModel.items != null && CatlogModel.items.isNotEmpty
            ? ListView.builder(
                itemCount: CatlogModel.items.length,
                itemBuilder: (context, index) => ItemWidgets(
                  items: CatlogModel.items[index],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: AppDrawer(),
    );
  }
}
