import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolstrijd/src/chatruimte.dart';
import 'src/homepage.dart';
import 'src/application.dart';
import 'src/verzenden.dart';
import 'src/cartscreen.dart';
import 'src/catalogscreen.dart';
import 'src/cartmodel.dart';
import 'src/catalogmodel.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
        ChangeNotifierProvider(
          create: (context) => ApplicationState(),
        ),
      ],
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Schoolstrijd',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepOrange,
            ),
        primaryColor: Colors.orange[800],
        accentColor: Colors.orange[200],
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
//        '/rooster': (context) => Rooster(),
        '/chatruimte': (context) => ChatRuimte(),
        '/verzenden': (context) => Verzenden(),
        '/catalog': (context) => MyCatalog(),
        '/cart': (context) => MyCart(),
      },
    );
  }
}
