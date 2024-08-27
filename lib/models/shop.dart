import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    //product 1
    Product(
        name: "Product 1",
        price: 100,
        description: "This is product 1",
        imagePath: "assets/backpack.png"),
    //product 2
    Product(
        name: "Product 2",
        price: 100,
        description: "This is product 2",
        imagePath: "assets/shoes.png"),
    //product 3
    Product(
        name: "Product 3",
        price: 100,
        description: "This is product 3",
        imagePath: "assets/tshirt.png"),
    //product 4
    Product(
        name: "Product 4",
        price: 100,
        description: "This is product 4",
        imagePath: "assets/sunglasses.png"),
  ];
  //user cart
  List<Product> _cart = [];
  // get product list
  List<Product> get shop => _shop;
  // get user cart
  List<Product> get cart => _cart;
  //add items to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
