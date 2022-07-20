class Product {
  List<Products> items = [];

  Product();

  Product.fromJsonList(List<dynamic> jsonList) {
    // ignore: unnecessary_null_comparison
    if (jsonList == null) return;

    for (var item in jsonList) {
      final pelicula =  Products.fromJson(item);
      items.add(pelicula);
    }
  }
}

class Products {
  String? productId;
  String? productName;
  String? description;
  int? price;
  String? imgProduct;

  Products({
    this.description,
    this.imgProduct,
    this.price,
    this.productId,
    this.productName,
  });

  Products.fromJson(Map<dynamic, dynamic> json) {
    productName = json['productName'];
    description = json['description'];
    productId = json['productId'];
    price = json['price'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['description'] = description;
    data['productId'] = productId;
    data['price'] = price;
    data['productName'] = productName;
    return data;
  }
}
