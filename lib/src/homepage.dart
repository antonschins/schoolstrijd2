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
                if (appState.attendees >= 2)
                  Paragraph('${appState.attendees} leerlingen aangemeld')
                else if (appState.attendees == 1)
                  Paragraph('1 leerling aangemeld')
                else
                  Paragraph('Nog niemand'),
                if (appState.loginState == ApplicationLoginState.loggedIn) ...[
                  YesNoSelection(
                    state: appState.attending,
                    onSelection: (attending) => appState.attending = attending,
                  ),
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

enum Attending { yes, no, unknown }

class YesNoSelection extends StatelessWidget {
  const YesNoSelection({required this.state, required this.onSelection});

  final Attending state;
  final void Function(Attending selection) onSelection;

  @override
  Widget build(BuildContext context) {
    switch (state) {
      case Attending.yes:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () => onSelection(Attending.yes),
                child: Text('Ik doe ook mee'),
              ),
              SizedBox(width: 8),
              TextButton(
                onPressed: () => onSelection(Attending.no),
                child: Text('Ik doe niet mee'),
              ),
            ],
          ),
        );
      case Attending.no:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              TextButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('Ik doe ook mee'),
              ),
              SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(elevation: 0),
                onPressed: () => onSelection(Attending.no),
                child: Text('Ik doe niet mee'),
              ),
            ],
          ),
        );
      default:
        return Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              StyledButton(
                onPressed: () => onSelection(Attending.yes),
                child: Text('YES'),
              ),
              SizedBox(width: 8),
              StyledButton(
                onPressed: () => onSelection(Attending.no),
                child: Text('NO'),
              ),
            ],
          ),
        );
    }
  }
}
