import 'package:flutter/material.dart';

class Rooster extends StatelessWidget {
  Rooster({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooster'),
      ),
      body: Center(child: Text('Ooo wat een mooi rooster')),
    );
  }
}
