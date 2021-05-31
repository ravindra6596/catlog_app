import 'package:catlog/models/catlog.dart';
import 'package:catlog/pages/home_details_page.dart';
import 'package:catlog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catlog_image.dart';

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catlog = CatlogModel.items[index];
        return InkWell(
          onTap: () =>
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeDetailsPage(catalog: catlog),
              ),
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
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: (catlog.id.toString()),
            child: CatlogImage(image: catlog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catlog.productName.text.bold.lg
                    .color(Themes.darkBluishColor)
                    .make(),
                catlog.descreption.text.textStyle(context.captionStyle)
                .make(),
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
