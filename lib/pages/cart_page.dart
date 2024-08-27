import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove item from cart
  void removeItemsFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove  this Item from your  Cart?"),
        actions: [
          //cancel button
          MaterialButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Cancel")),
          // yes button
          MaterialButton(
            onPressed: () {
              //pop dialog box
              Navigator.of(context).pop();
              //add product to cart
              context.read<Shop>().removeFromCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

// pay button pressed
  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("User wants to pay "),
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
        title: Text("Cart Page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          //cart List
          Expanded(
            child: cart.isEmpty
                ? Center(child: Text("Your cart is empty..."))
                : ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      //get individual item in cart
                      final item = cart[index];
                      // return as a cart title UI
                      return ListTile(
                        title: Text(item.name),
                        subtitle: Text(item.price.toStringAsFixed(2)),
                        trailing: IconButton(
                            onPressed: () => removeItemsFromCart(context, item),
                            icon: Icon(Icons.remove)),
                      );
                    },
                  ),
          ),

          // pay button
          if (cart.isNotEmpty)
            Padding(
              padding: EdgeInsets.all(50),
              child: MyButton(
                child: Text("Pay Now"),
                onTap: () => payButtonPressed(context),
              ),
            )
        ],
      ),
    );
  }
}
