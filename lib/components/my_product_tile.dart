// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/components/my_button.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  // add to cart button pressed
  void addToCart(BuildContext context) {
    //show a dialog box to ask user to confirm to add to cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this Item to Cart?"),
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
              context.read<Shop>().addToCart(product);
            },
            child: Text("Yes"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(35),
                    ),
                    width: double.infinity,
                    padding: EdgeInsets.all(30),
                    child: Icon(Icons.favorite)),
              ),
              SizedBox(height: 25),

              //product name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
              ),
              SizedBox(height: 25),
              // product discription
              Text(
                product.description,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),
          SizedBox(height: 25),
          // product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(product.price.toStringAsFixed(2)),
              // add to cart button
              Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: IconButton(
                      onPressed: () => addToCart(context),
                      icon: Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
