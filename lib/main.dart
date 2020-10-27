import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repositories/repositories.dart';
import 'ui/screens/HomePage.dart';
import 'blocs/dashboard_bloc.dart';


class SimpleBlocObserver extends BlocObserver {

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();

  final DashboardRepository dashboardRepository = DashboardRepository(
    dashboardApiClient: DashboardApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(App(
    dashboardRepository: dashboardRepository,
  ));
}

class App extends StatelessWidget {
  final DashboardRepository dashboardRepository;

  App({Key key, @required this.dashboardRepository})
      : assert(dashboardRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyEth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
        create: (context) =>
            DashboardBloc(dashboardRepository: dashboardRepository),
        child: HomePage(),
      ),
    );
  }
}