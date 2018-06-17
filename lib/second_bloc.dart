import 'dart:async';

import 'package:rxdart/rxdart.dart';

class SecondBloc {
  PublishSubject<bool> _outputs = PublishSubject<bool>();

  PublishSubject<bool> _inputs = PublishSubject<bool>();

  SecondBloc() {
    _outputs.addStream(_inputs.stream
        .asyncMap((_) => Future.delayed(Duration(seconds: 3), () => true))
        .asBroadcastStream());
  }

  Stream<bool> get out => _outputs;

  Sink<bool> get input => _inputs;
}
