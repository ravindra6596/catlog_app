import 'package:catlog/core/store.dart';
import 'package:catlog/models/cart.dart';
import 'package:catlog/models/catlog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Items catlog;
  AddToCart({
    Key key,
    this.catlog,
  }) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutaion, RemoveMutaion]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catlog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          context.theme.buttonColor,
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      onPressed: () {
        if (!isInCart) {
          AddMutaion(catlog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
