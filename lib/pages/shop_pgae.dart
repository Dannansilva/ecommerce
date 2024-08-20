import 'package:ecommerce/components/my_drawer.dart';
import 'package:flutter/material.dart';

class ShopPgae extends StatelessWidget {
  const ShopPgae({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Shop"),
      ),
      drawer: MyDrawer(),
    );
  }
}
