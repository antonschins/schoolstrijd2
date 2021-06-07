import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'src/homepage.dart';
import 'src/application.dart';

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
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Home1Page(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => SecondScreen(),
        '/third': (context) => Third(),
        '/fourth': (context) => HomePage(),
      },
    );
  }
}

class Home1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Homepage Screen'),
//      ),
//      body: Center(
//        child: ElevatedButton(
//          onPressed: () {
//            Navigator.pushNamed(context, '/second');
//          },
//          child: Text('Go to Second'),
//        ),
    return ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        AppBar(
          title: Text('Maak je keuze')
        ),
        Container(
          height: 100,
          color: Colors.amber[600],
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/fourth');
            },
            child: Text('INLOGGEN'),
          ),
        ),
        Container(
          height: 100,
          color: Colors.amber[500],
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('ROOSTER'),
          ),
        ),
        Container(
          height: 100,
          color: Colors.amber[100],
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/third');
            },
            child: Text('STEMMEN'),
          ),
        ),
      ],
    );

//        ),
//      ),
//    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/third');
          },
          child: Text('Go to third'),
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/');
          },
          child: Text('Go to HomePage'),
        ),
      ),
    );
  }
}
