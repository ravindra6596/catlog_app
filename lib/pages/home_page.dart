import 'package:catlog/widgets/drawer.dart';
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
      body: Center(
        child: Container(
          child: Text('Hello'),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
