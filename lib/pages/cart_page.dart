import 'package:catlog/core/store.dart';
import 'package:catlog/models/cart.dart';
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
  final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxBuilder(
            mutations: {RemoveMutaion},
            builder: (context, store, VxStatus status) {
              return '\$${_cart.totalPrice}'
                  .text
                  .xl5
                  .color(context.theme.accentColor)
                  .make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying Not Supported yet".text.make(),
                ),
              );
            },
            child: 'Buy'.text.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutaion]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? 'Nothing To Show'.text.xl4.makeCentered()
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(Icons.remove_circle_outline),
                onPressed: () => RemoveMutaion(_cart.items[index]),
              ),
              title: _cart.items[index].productName.text.make(),
            ),
          );
  }
}
