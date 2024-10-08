// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:ffi';

import 'package:ecommerce/components/my_button.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 25),

            //title
            Text("Minimal Shop",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.secondary)),
            SizedBox(height: 10),
            //subtitle
            Text("Premium quality products",
                style: TextStyle(
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary)),
            SizedBox(height: 25),
            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop'),
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}
