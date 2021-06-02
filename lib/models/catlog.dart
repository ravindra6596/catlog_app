class CatlogModel {
  static List<Items> items;

  // for cart page find by ID
  Items getById(int id) => items.firstWhere(
        (element) => element.id == id,
        orElse: null,
      );
  // get item by position
  Items getByPosition(int pos) => items[pos];
}

class Items {
  Items({
    this.id,
    this.productName,
    this.descreption,
    this.color,
    this.price,
    this.image,
  });
  final int id;
  final String productName;
  final String descreption;
  final String color;
  final num price;
  final String image;

  factory Items.fromMap(Map<String, dynamic> map) {
    return Items(
      id: map['id'],
      productName: map['productName'],
      descreption: map['descreption'],
      color: map['color'],
      price: map['price'],
      image: map['image'],
    );
  }

  toMap() => {
        'id': id,
        'productName': productName,
        'descreption': descreption,
        'color': color,
        'price': price,
        'image': image,
      };
}
