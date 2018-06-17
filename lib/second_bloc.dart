import 'dart:async';

import 'package:rxdart/rxdart.dart';

class SecondBloc {
  Stream<bool> _outputs = new Stream.empty();

  PublishSubject<bool> _inputs = PublishSubject<bool>();

  SecondBloc() {
    _outputs = _inputs.asyncMap((_) => true).asBroadcastStream();
  }

  Stream<bool> get out => _outputs;

  Sink<bool> get input => _inputs;
}
