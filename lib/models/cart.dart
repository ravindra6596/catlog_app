import 'package:catlog/models/catlog.dart';

class CartModel {
  static final cartModel = CartModel._internal();
  CartModel._internal();
  factory CartModel() => cartModel;

  // Catlog fields
  CatlogModel _catlog;
  // collection of id's stored ids of each item

  final List<int> _itemIds = [];
// get catlog
  CatlogModel get catlog => _catlog;
  set catlog(CatlogModel newcatlog) {
    assert(newcatlog != null);
    _catlog = newcatlog;
  }

  // get items in the cart
  List<Items> get items => _itemIds
      .map(
        (id) => _catlog.getById(id),
      )
      .toList();
  // get total price
  // fold() means addition / combination
  num get totalPrice => items.fold(
        0,
        (total, current) => total + current.price,
      );
  // add item
  void addItem(Items items) {
    _itemIds.add(items.id);
  }

  // remove item
  void removeItem(Items items) {
    _itemIds.remove(items.id);
  }
}
