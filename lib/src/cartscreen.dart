import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cartmodel.dart';
import 'dart:async';
import 'application.dart';
import 'widgets.dart';

class MyCart extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1!.copyWith(fontSize: 48);

    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Another way to listen to a model's change is to include
            // the Consumer widget. This widget will automatically listen
            // to CartModel and rerun its builder on every change.
            //
            // The important thing is that it will not rebuild
            // the rest of the widgets in this build method.
            Consumer<CartModel>(
                builder: (context, cart, child) =>
                    Text('${cart.itemnrs.length} onderdelen')),  //, style: hugeStyle)),
            SizedBox(width: 24),
            Verzenden(),
          ],
        ),
      ),
    );
  }
}

class Verzenden extends StatelessWidget {
  Verzenden({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          children: <Widget>[
            Consumer<ApplicationState>(
              builder: (context, appState, _) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ActiLijst(
                    addActilijst: (List actilijst) =>
                        appState.addMessageToActiLijst(actilijst),
                    actilists: appState.actiLijstMessages,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActiLijstMessage {
  ActiLijstMessage({required this.name, required this.actilijst});

  final String name;
  final List actilijst;
}

class ActiLijst extends StatefulWidget {
  ActiLijst({required this.addActilijst, required this.actilists});

  final FutureOr<void> Function(List actilijst) addActilijst;
  final List<ActiLijstMessage> actilists;

  @override
  _ActiLijstState createState() => _ActiLijstState();
}

class _ActiLijstState extends State<ActiLijst> {
//  final _formKey = GlobalKey<FormState>(debugLabel: '_ActiLijstState');

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();

    return SizedBox(
      height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StyledButton(
              onPressed: () async {
                await widget.addActilijst(cart.itemnrs); //cart.itemnrs
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Verzonden')));
              },
              child: Row(
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 4),
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
