class Items {
  Items({
    this.id,
    this.productName,
    this.descreption,
    this.color,
    this.price,
    this.image,
  });
  final String id;
  final String productName;
  final String descreption;
  final String color;
  final num price;
  final String image;
}

final products = [
  Items(
    id: "P1",
    productName: "iPhone 12 Pro",
    descreption: "Apple iPhone 12 Generation",
    color: "#33505a",
    price: 99999,
    image:
        "https://www.reliancedigital.in/medias/Apple-12-Smartphones-491901533-i-1-1200Wx1200H?context=bWFzdGVyfGltYWdlc3wxMTMwMTd8aW1hZ2UvanBlZ3xpbWFnZXMvaDM2L2g1OC85NDA3NzMxMTcxMzU4LmpwZ3w5NjBiYTIzZWE1Yjg5NjQzN2YyZTAxZjNhNGI2ODg0YzQ4NmZlMDZiN2EwYmVkYjlhZjA3OGIxNDZiNDEzNTc0",
  ),
];
