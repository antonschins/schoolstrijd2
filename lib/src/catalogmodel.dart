import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Sport',
    'Dansen',
    'Muziek',
    'Schaken',
    'Puzzelen',
    'SET',
    'Project X',
  ];

  Item getById(int id) {
    return Item(id, itemNames[id]);
  }

}

@immutable
class Item {
  final int id;
  final String name;
//  final Color color=Colors.orange;
//  final int price = 1;

  Item(this.id, this.name);

  @override
   bool operator ==(Object other) => other is Item && other.id == id;
}
