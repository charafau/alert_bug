import 'package:alert_bug/second_bloc.dart';
import 'package:flutter/widgets.dart';

class BlocProvider extends InheritedWidget {
  final SecondBloc secondBloc;

  static SecondBloc second(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProvider) as BlocProvider)
          .secondBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  BlocProvider({Key key, SecondBloc secondBloc, Widget child})
      : this.secondBloc = secondBloc,
        super(child: child, key: key);
}
