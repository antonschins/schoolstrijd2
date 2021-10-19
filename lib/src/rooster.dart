import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Rooster extends StatelessWidget {
  const Rooster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ooo mooi rooster'),
      ),
      body: Container(
        decoration: new BoxDecoration(color: Colors.orange[300]),
        child: Column(children: [
          Text('aap'),
          Text('aap'),
        ]),
      ),
    );
  }
}
