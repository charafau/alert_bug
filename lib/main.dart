import 'package:alert_bug/bloc_provider.dart';
import 'package:alert_bug/second_bloc.dart';
import 'package:alert_bug/second_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MainApp());

const String title = 'Alert Bug';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      secondBloc: SecondBloc(),
      child: MaterialApp(
        title: title,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('click!'),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SecondScreen()));
              },
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
