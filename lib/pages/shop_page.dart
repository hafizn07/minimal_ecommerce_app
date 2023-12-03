import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_drawer.dart';
import 'package:minimal_ecommerce_app/components/my_header.dart';
import 'package:minimal_ecommerce_app/components/my_product_tile.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          //goto cart page
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/cart_page"),
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          // Header
          const MyHeader(
            heading: "Shop",
            subHeading: "Pick from a selected list of premium products.",
          ),

          // Product list
          SizedBox(
            height: 585,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) {
                // Get each individual product from shop
                final product = products[index];

                // Return a product tile UI
                return MyProductTile(product: product);
              },
            ),
          ),

          const SizedBox(height: 35),
          // Text at the bottom
          Text(
            "minimal x shop",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
