import 'dart:convert';

import 'package:catlog/models/catlog.dart';
import 'package:catlog/widgets/drawer.dart';
import 'package:catlog/widgets/item_widget.dart';
import 'package:catlog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

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
      backgroundColor: Themes.creamColor,
      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                CatlogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),

      /*   appBar: AppBar(
        title: Text(
          'Catlog',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CatlogModel.items != null && CatlogModel.items.isNotEmpty
            ? /* ListView.builder(
                itemCount: CatlogModel.items.length,
                itemBuilder: (context, index) => ItemWidgets(
                  items: CatlogModel.items[index],
                ),
              ) */
            GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final items = CatlogModel.items[index];
                  return Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: GridTile(
                      header: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                        ),
                        child: Text(
                          items.productName,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      child: Image.network(items.image),
                      footer: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        child: Text(
                          '₹ ${items.price}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: CatlogModel.items.length,
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: AppDrawer(), */
    );
  }
}

class CatlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App".text.xl4.bold.color(Themes.darkBluishColor).make(),
        "Trainding Products".text.make(),
      ],
    );
  }
}

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catlog = CatlogModel.items[index];
        return CatlogItem(catlog: catlog);
      },
    );
  }
}

class CatlogItem extends StatelessWidget {
  final Items catlog;

  const CatlogItem({Key key, @required this.catlog})
      : assert(catlog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          CatlogImage(image: catlog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catlog.productName.text.bold.lg
                    .color(Themes.darkBluishColor)
                    .make(),
                catlog.descreption.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    '\$${catlog.price}'.text.bold.xl.make(),
                    ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Themes.darkBluishColor,
                          ),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      onPressed: () {},
                      child: "Buy".text.make(),
                    ),
                  ],
                ).pOnly(right: 8.0),
              ],
            ),
          ),
        ],
      ),
    ).white.rounded.square(150).make().py(16);
  }
}

class CatlogImage extends StatelessWidget {
  final String image;

  const CatlogImage({Key key, @required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(Themes.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
