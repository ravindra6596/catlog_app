import 'package:catlog/models/catlog.dart';
import 'package:catlog/pages/home_details_page.dart';
import 'package:catlog/utils/routs.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'add_to_cart.dart';
import 'catlog_image.dart';

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            shrinkWrap: true,
            itemCount: CatlogModel.items.length,
            itemBuilder: (context, index) {
              final catlog = CatlogModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDetailsPage(catalog: catlog),
                  ),
                ),
                child: CatlogItem(catlog: catlog),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: CatlogModel.items.length,
            itemBuilder: (context, index) {
              final catlog = CatlogModel.items[index];
              return InkWell(
                onTap: () => context.vxNav.push(
                  Uri(
                    path: MyRoutes.homeDetailsRoute,
                    queryParameters: {
                      "id": catlog.id.toString(),
                    },
                  ),
                  params: catlog,
                ),
                child: CatlogItem(catlog: catlog),
              );
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
    var children2 = [
      Hero(
        tag: (catlog.id.toString()),
        child: CatlogImage(image: catlog.image),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catlog.productName.text.bold.lg.color(context.accentColor).make(),
            catlog.descreption.text.textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                '\$${catlog.price}'.text.bold.xl.make(),
                AddToCart(catlog: catlog),
              ],
            ).pOnly(right: 8.0),
          ],
        ).p(context.isMobile ? 0 : 16),
      ),
    ];
    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).color(context.cardColor).rounded.square(150).make().py(16);
  }
}
