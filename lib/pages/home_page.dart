import 'package:catlog/models/catlog.dart';
import 'package:catlog/widgets/drawer.dart';
import 'package:catlog/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
        child: ListView.builder(
          itemCount: CatlogModel.items.length,
          itemBuilder: (context, index) {
            return ItemWidgets(items: CatlogModel.items[index],);
          },
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
