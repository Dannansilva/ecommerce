import 'package:ecommerce/components/my_drawer.dart';
import 'package:ecommerce/components/my_product_tile.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/shop.dart';

class ShopPgae extends StatelessWidget {
  const ShopPgae({super.key});

  @override
  Widget build(BuildContext context) {
    // access products in shop
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop"),
      ),
      drawer: MyDrawer(),
      body: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.all(25),
        itemBuilder: (context, index) {
          // get each individual Product from shop
          final product = products[index];
          // return as a product title UI
          return MyProductTile(product: product);
        },
      ),
    );
  }
}
