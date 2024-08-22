// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      child: Column(
        children: [
          //product image
          Icon(Icons.favorite),
          //product name
          Text(product.name),
          // product discription
          Text(product.description),

          // product price + add to cart button
          Text(product.price.toStringAsFixed(2)),
        ],
      ),
    );
  }
}
