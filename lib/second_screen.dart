import 'dart:async';

import 'package:alert_bug/bloc_provider.dart';
import 'package:alert_bug/second_bloc.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
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
              bloc.out.listen((_) async {
                Navigator.of(context).pop();
              });

              bloc.input.add(true);
              return new AlertDialog(
                title: new Text("My Super title"),
                content: new Text("Hello World"),
              );
            },
          );

          dialogFuture.whenComplete(() => Navigator.of(context).pop());
        },
      ),
    );
  }
}
