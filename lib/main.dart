// ignore_for_file: prefer_const_constructors

import 'package:ecommerce/pages/intro_page.dart';
import 'package:ecommerce/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/shop.dart';
import 'pages/cart_page.dart';
import 'pages/shop_pgae.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightMode,
      routes: {
        '/intro': (context) => IntroPage(),
        '/shop': (context) => ShopPgae(),
        '/cart': (context) => CartPage(),
      },
    );
  }
}
