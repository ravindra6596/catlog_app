import 'package:catlog/models/catlog.dart';
import 'package:catlog/widgets/home_widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Items catalog;
  const HomeDetailsPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: context.canvasColor,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: (catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                height: 30.0,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.productName.text.bold.xl4
                          .color(context.accentColor)
                          .make(),
                      catalog.descreption.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      10.heightBox,
                      "Rebum justo erat at eirmod dolores et sanctus ea aliquyam elitr. Takimata justo elitr ipsum et at. Diam vero sed. "
                          .text
                          .textStyle(
                            context.captionStyle,
                          )
                          .xl
                          .make()
                          .p16(),
                    ],
                  ).py64(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            '\$${catalog.price}'.text.bold.xl4.red800.make(),
            AddToCart(
              catlog: catalog,
            ).wh(120, 50),
          ],
        ).p32(),
      ),
    );
  }
}
