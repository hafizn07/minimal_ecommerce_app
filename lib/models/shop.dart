import 'package:minimal_ecommerce_app/models/product.dart';

class Shop {
  //product for sale
  final List<Product> _shop = [
    //product1
    Product(
      name: "product1",
      price: 99.99,
      description: "product description 1",
    ),
    //product2
    Product(
      name: "product2",
      price: 99.99,
      description: "product description 2",
    ),
    //product3
    Product(
      name: "product3",
      price: 99.99,
      description: "product description 3",
    ),
    //product4
    Product(
      name: "product4",
      price: 99.99,
      description: "product description 4",
    ),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;

  //add item to the cart
  void addToCart(Product item) {
    _cart.add(item);
  }

  //remove item from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
  }
}
