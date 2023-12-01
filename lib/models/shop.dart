import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    //product1
    Product(
      name: "Bose QuietComfort Ultra Headphones",
      price: 349.99,
      description:
          "Bose QC 45 Over-Ear Headphones with Bluetooth, Noise Cancelling, and Built-in Mic in Triple Black.",
      imagePath: "assets/Bose.png",
    ),
    //product2
    Product(
      name: "DJI Osmo Pocket 3",
      price: 519.99,
      description:
          "DJI Osmo Pocket 3: 4K/120fps Video, 3-Axis Stabilization, Face/Object Tracking, Fast Focusing.",
      imagePath: "assets/dji.png",
    ),
    //product3
    Product(
      name: "CMF by Nothing Watch Pro",
      price: 49.99,
      description:
          "Nothing Watch Pro: 1.96 AMOLED, BT calling, AI noise reduction, GPS Smartwatch (Dark Grey Strap).",
      imagePath: "assets/cmf.webp",
    ),
    //product4
    Product(
      name: "PS5™ console",
      price: 649.99,
      description:
          "Experience Ultra-high-speed SSD, haptic feedback, adaptive triggers, 3D Audio, next-gen gaming.",
      imagePath: "assets/ps5.webp",
    ),
  ];

  //user cart
  final List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to the cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
