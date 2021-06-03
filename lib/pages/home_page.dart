import 'dart:convert';

import 'package:catlog/core/store.dart';
import 'package:catlog/models/cart.dart';
import 'package:catlog/models/catlog.dart';
import 'package:catlog/utils/routs.dart';
import 'package:catlog/widgets/home_widgets/catlog_header.dart';
import 'package:catlog/widgets/home_widgets/catlog_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = 'https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3';
  @override
  void initState() {
    super.initState();
    loadJSONData();
  }

  loadJSONData() async {
    await Future.delayed(Duration(seconds: 2));
   // for own static json file
    final catlogJSON = await rootBundle.loadString('assets/files/catlog.json');
    // final jsonResponse = await http.get(Uri.parse(url));
    // final catlogJson = jsonResponse.body;
    final decodedData = jsonDecode(catlogJSON);
    var productsData = decodedData['products'];
    CatlogModel.items = List.from(productsData)
        .map<Items>((items) => Items.fromMap(items))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.cardColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                CatlogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      floatingActionButton: VxBuilder(
        mutations: {AddMutaion, RemoveMutaion},
        builder: (BuildContext context, store, VxStatus status) =>
            FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
          backgroundColor: context.theme.buttonColor,
        ).badge(
                color: Vx.red500,
                size: 20,
                count: _cart.items.length,
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                )),
      ),
    );
  }
}
