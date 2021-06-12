import 'package:flutter/material.dart';
import 'widgets.dart';
import 'application.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'cartmodel.dart';

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

//  final _controller = TextEditingController();

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
                await widget.addActilijst(cart.itemnrs); //effe opzoeken
//                    if (_formKey.currentState!.validate()) {
//                      await widget.addActilijst(_controller.text);
//                      _controller.clear();
//                    }
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
//          ),
//        ),
//        SizedBox(height: 8),
//        for (var message in widget.actilists)
//          Paragraph('${message.name}: ${message.actilijst}'),
//        SizedBox(height: 8),
//      ],
      ),
    );
  }
}
