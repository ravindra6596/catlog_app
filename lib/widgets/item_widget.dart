import 'package:catlog/models/catlog.dart';
import 'package:flutter/material.dart';

class ItemWidgets extends StatelessWidget {
  final Items items;

  const ItemWidgets({Key key, @required this.items})
      : assert(items != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
          child: ListTile(
        leading: Image.network(items.image),
        title: Text(items.productName),
        subtitle: Text(items.descreption),
        trailing: Text(
          '₹ ${items.price}',
          style: TextStyle(
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
          textScaleFactor: 1.5,
        ),
      ),
    );
  }
}
