import 'package:flutter/material.dart';
import 'package:myethermine/blocs/dashboard_bloc.dart';

class DashboardProvider extends InheritedWidget{
  final DashboardBloc bloc;

  DashboardProvider({Key key, Widget child})
      : bloc = DashboardBloc(),
        super(key: key, child: child);
        bool Update
}