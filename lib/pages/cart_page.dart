import 'package:flutter/material.dart';
import 'package:minimal_ecommerce_app/components/my_button.dart';
import 'package:minimal_ecommerce_app/components/my_header.dart';
import 'package:minimal_ecommerce_app/models/product.dart';
import 'package:minimal_ecommerce_app/models/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    //show a dialog box to ask the user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text('Remove "${product.name}" from your cart?'),
        actions: [
          //cancel button
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),

          //yes button
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              //remove from cart
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  //user press the pay button
  void handlePayment(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text(
            "User wants to pay! Connect this app to your payment backend."),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //header
          const MyHeader(
            heading: "Cart",
            subHeading: "Check your cart before paying!",
          ),
          //cart list
          Expanded(
            child: cart.isEmpty
                ? const Center(
                    child: Text("Hey! Your cart is empty..."),
                  )
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in the cart
                      final item = cart[index];

                      //return as a cart tile UI
                      return Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.secondary,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(item.imagePath),
                          ),
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                            onPressed: () => removeItemFromCart(context, item),
                            icon: const Icon(Icons.cancel_outlined),
                          ),
                        ),
                      );
                    },
                  ),
          ),

          //pay button
          cart.isEmpty
              ? Container()
              : SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(50.0),
                    child: MyButton(
                      onTap: () => handlePayment(context),
                      child: const Text(
                        "PAY NOW",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
