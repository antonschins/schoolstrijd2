import 'package:flutter/material.dart';
import 'authentication.dart';
import 'guestbook.dart';
import 'widgets.dart';
import 'application.dart';
import 'package:provider/provider.dart';

class ChatRuimte extends StatelessWidget {
//  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatruimte'),
      ),
      body: ListView(
        children: <Widget>[
//          Header("Gebruik de nieuwe App"),
//          Paragraph(
//            'Twee dagen strijden alle klassen tegen elkaar',
//          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  Header('Chat hieronder'),
                  GuestBook(
                    addMessage: (String message) =>
                        appState.addMessageToGuestBook(message),
                    messages: appState.guestBookMessages,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}