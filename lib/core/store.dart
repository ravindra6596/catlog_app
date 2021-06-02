import 'package:catlog/models/cart.dart';
import 'package:catlog/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  CatlogModel catlog;
  CartModel cart;

  MyStore() {
    catlog = CatlogModel();
    cart = CartModel();
    cart.catlog = catlog;
  }
}
