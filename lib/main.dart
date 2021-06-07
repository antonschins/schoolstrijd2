import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:schoolstrijd/src/chatruimte.dart';
import 'src/homepage.dart';
import 'src/application.dart';
import 'src/rooster.dart';
import 'src/stemmen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ApplicationState(),
      builder: (context, _) => App(),
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
        primarySwatch: Colors.orange,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
//      home: HomePage(),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/rooster': (context) => Rooster(),
        '/chatruimte': (context) => ChatRuimte(),
        '/stemmen': (context) => Stemmen(),
      },
    );
  }
}