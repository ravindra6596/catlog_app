import 'package:catlog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
      ),
      backgroundColor: Themes.creamColor,
      body: Column(
        children: [
          CartList().p32().expand(),
          Divider(),
          CartTotal(),
        ],
      ),
    );
  }
}

class CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          '\$9999'.text.xl5.color(context.theme.accentColor).make(),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(context.theme.buttonColor)),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: "Buying Not Supported yet".text.make()),
              );
            },
            child: 'Buy'.text.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}

class CartList extends StatefulWidget {
  @override
  _CartListState createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {},
        ),
        title: 'Item 1'.text.make(),
      ),
    );
  }
}
