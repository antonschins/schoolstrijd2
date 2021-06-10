// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartmodel.dart';
import 'catalogmodel.dart';
import 'cartscreen.dart';
import 'catalogscreen.dart';
//import 'screens/login.dart';

//void main() {
//  runApp(MyApp());
//}

class Kiezen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.

    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),
        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
//        Provider(create: (context) => BoeModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Schoolstrijd App',
        theme: ThemeData(
          primaryColor: Colors.orange[800],
          accentColor: Colors.orange[200],
//  primarySwatch: Colors.orange,
//  textTheme: TextTheme(
//    headline1: TextStyle(
//      fontFamily: 'Corben',
//      fontWeight: FontWeight.w700,
//      fontSize: 24,
//      color: Colors.black,
//    ),
//  ),
        ),


//        initialRoute: '/',
//        routes: {
//          '/catalog': (context) => MyCatalog(),
//          '/cart': (context) => MyCart(),
//        },
      ),
          );
  }
}