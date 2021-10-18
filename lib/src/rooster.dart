import 'package:flutter/material.dart';

class Rooster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mooi rooster zeg'),
        //style: Theme.of(context).textTheme.headline1),
//        actions: [
//          IconButton(
//            icon: Icon(Icons.arrow_forward_outlined),
//            onPressed: () => Navigator.pushNamed(context, '/cart'),
//          ),
//        ],
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.orange[300]),
        child: Text('hier moet rooster komen'),
        ),
      );
  }
}
