// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/components/my_list_title.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              //drawer header : logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              //shop title
              MyListTitle(
                text: "Shop",
                icon: Icons.home,
                onTap: () => Navigator.pop(context),
              ),
              // cart title
              MyListTitle(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () {
                  //pop drawer first
                  Navigator.pop(context);
                  //go to cart page
                  Navigator.pushNamed(context, '/cart');
                },
              ),
            ],
          ),
          //exit
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: MyListTitle(
              text: "Exit",
              icon: Icons.logout,
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/intro', (route) => false);
              },
            ),
          )
        ],
      ),
    );
  }
}
