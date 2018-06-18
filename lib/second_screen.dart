import 'dart:async';

import 'package:alert_bug/bloc_provider.dart';
import 'package:alert_bug/second_bloc.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  StreamSubscription _subscription;

  @override
  Widget build(BuildContext context) {
    SecondBloc bloc = BlocProvider.second(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Second screen'),
      ),
      body: RaisedButton(
        child: Text('alert'),
        onPressed: () {
          var dialogFuture = showDialog(
            context: context,
            builder: (_) {
              _subscription = bloc.out.listen((_) async {
                Navigator.of(context).pop();
              });

              bloc.input.add(true);
              return new AlertDialog(
                title: new Text("My Super title"),
                content: new Text("Hello World"),
              );
            },
          );

          dialogFuture.whenComplete(() {
            _subscription.cancel();
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}
