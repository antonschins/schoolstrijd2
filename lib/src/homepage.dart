import 'package:flutter/material.dart';
import 'authentication.dart';
import 'widgets.dart';
import 'application.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schoolstrijd 2021'),
      ),
      body: ListView(
        children: <Widget>[
          Image.asset('assets/Merl-Milo-Coen-Storr-Sam-Hugo.jpg'),
          SizedBox(height: 8),
          IconAndDetail(Icons.calendar_today, '13 en 14 februari'),
//          IconAndDetail(Icons.location_city, 'San Francisco'),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Authentication(
              email: appState.email,
              loginState: appState.loginState,
              startLoginFlow: appState.startLoginFlow,
              verifyEmail: appState.verifyEmail,
              signInWithEmailAndPassword: appState.signInWithEmailAndPassword,
              cancelRegistration: appState.cancelRegistration,
              registerAccount: appState.registerAccount,
              signOut: appState.signOut,
            ),
          ),
          Divider(
            height: 8,
            thickness: 1,
            indent: 8,
            endIndent: 8,
            color: Colors.grey,
          ),
//          Header("Gebruik de nieuwe App"),
//          Paragraph(
//            'Twee dagen strijden alle klassen tegen elkaar',
//          ),
          Consumer<ApplicationState>(
            builder: (context, appState, _) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 4,right: 24),
                    child: StyledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/catalog');
                      },
                      child: Text('Kiezen'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 4,right: 24),
                    child: StyledButton( //ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/chatruimte');
                      },
                      child: Text('Chatruimte'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 4,right: 24),
                    child: StyledButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/rooster');
                      },
                      child: Text('Rooster'),
                    ),
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
