import '../../widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
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