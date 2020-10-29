import 'package:device_preview/device_preview.dart';
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
  void onEvent(Bloc bloc, Object event) {
    print('onEvent $event');
    super.onEvent(bloc, event);
  }

  @override
  onTransition(Bloc bloc, Transition transition) {
    print('onTransition $transition');
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    print('onError $error');
    super.onError(cubit, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();

  final DashboardRepository dashboardRepository = DashboardRepository(
    dashboardApiClient: DashboardApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    DevicePreview(
      // enabled: !kReleaseMode,
      // toolBarStyle: DevicePreviewToolBarStyle.light(),
      builder: (context) => App(dashboardRepository: dashboardRepository),
    ),
  );
}

class App extends StatelessWidget {
  final DashboardRepository dashboardRepository;

  App({Key key, @required this.dashboardRepository})
      : assert(dashboardRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale, // <--- /!\ Add the locale
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
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