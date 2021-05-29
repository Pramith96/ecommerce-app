import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:project/providers/product.dart';

class ProductProvder with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '001',
        title: 'Cloth',
        description: 'A towel for men',
        price: 1000.00,
        imgUrl: 'assets/images/cloth.jpg'),
    Product(
        id: '002',
        title: 'Denim',
        description: 'Denim for men & women',
        price: 2000.00,
        imgUrl: 'assets/images/denim.jpg'),
    Product(
        id: '003',
        title: 'Frock',
        description: 'Frocks for women',
        price: 1500.00,
        imgUrl: 'assets/images/frock.jpg'),
    Product(
        id: '004',
        title: 'Spoons',
        description: 'Spoons in the kichen',
        price: 500.00,
        imgUrl: 'assets/images/spoons.jpg'),
    Product(
        id: '005',
        title: 'Sunglass',
        description: 'Sunglasses for men',
        price: 800.00,
        imgUrl: 'assets/images/sunglass.jpg'),
    Product(
        id: '006',
        title: 'Tshirt',
        description: 'Tshirt designs for men',
        price: 1000.00,
        imgUrl: 'assets/images/Tshirt.jpg'),
    Product(
        id: '007',
        title: 'watch',
        description: 'Beautiful watches in low price',
        price: 3000.00,
        imgUrl: 'assets/images/watch.jpg'),
    Product(
        id: '008',
        title: 'Door',
        description: 'Door design for your dream house',
        price: 10000.00,
        imgUrl: 'assets/images/door.jpg'),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouriteItem {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProduct() {
    notifyListeners();
  }
}
