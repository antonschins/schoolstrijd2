import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartmodel.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
//import 'widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MyCart extends StatelessWidget {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gekozen'), //style: Theme.of(context).textTheme.headline1),
        backgroundColor: Colors.orange[800],
      ),
      body: Container(
        color: Colors.orange[300],
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: _CartList(),
              ),
            ),
            Divider(height: 4, color: Colors.black),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.headline6;
    // This gets the current state of CartModel and also tells Flutter
    // to rebuild this widget when CartModel notifies listeners (in other words,
    // when it changes).
    var cart = context.watch<CartModel>();

    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
        leading: Icon(Icons.done),
        trailing: IconButton(
          icon: Icon(Icons.remove_circle_outline),
          onPressed: () {
            cart.remove(cart.items[index]);
          },
        ),
        title: Text(
          cart.items[index].name,
          style: itemNameStyle,
        ),
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  //  final List lijst;

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called activiteiten that references the firestore collection
    CollectionReference activiteiten =
        FirebaseFirestore.instance.collection('activiteiten');

    var cart = context.watch<CartModel>();
    var lijst = cart.itemnrs;

    Future<void> addActi() {
      // Call the activiteiten's CollectionReference to add a new list
      return activiteiten
          .add({
        'list': cart.itemnrs,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        'name': FirebaseAuth.instance.currentUser!.displayName,
        'userId': FirebaseAuth.instance.currentUser!.uid,
          })
          .then((value) => print("Lijst activiteiten toegevoegd"))
          .catchError((error) => print("Failed to add activiteiten: $error"));
    }

    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${cart.itemnrs.length} onderdelen'), //),
            SizedBox(width: 24),
            ElevatedButton(
              onPressed: () {
                addActi();
              },
              child: Row(
                children: [
                  Icon(Icons.send),
                  Text('verzenden'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
