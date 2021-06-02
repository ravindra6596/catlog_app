import 'package:catlog/core/store.dart';
import 'package:catlog/models/catlog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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

}

// add mutation
class AddMutaion extends VxMutation<MyStore> {
  final Items items;

  AddMutaion(this.items);
  @override
  perform() {
    store.cart._itemIds.add(items.id);
  }
}

// remove mutation
class RemoveMutaion extends VxMutation<MyStore> {
  final Items items;

  RemoveMutaion(this.items);
  @override
  perform() {
    store.cart._itemIds.remove(items.id);
  }
}
