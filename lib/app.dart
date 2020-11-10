import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/blocs.dart';
import 'repositories/repositories.dart';

import 'ui/screens/HomeScreen.dart';
import 'ui/screens/IntroScreen.dart';
import 'ui/screens/SplashScreen.dart';

class App extends StatelessWidget {
  final DashboardRepository dashboardRepository;
  final DashboardEthRepository dashboardEthRepository;

  @required
  App({Key key, this.dashboardRepository, this.dashboardEthRepository})
      : assert(dashboardRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'MyEth',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      // theme: ThemeData.system,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<DashboardBloc>(
                create: (context) =>
                    DashboardBloc(dashboardRepository: dashboardRepository),
              ),
              BlocProvider<DashboardEthBloc>(
                create: (context) => DashboardEthBloc(
                    dashboardEthRepository: dashboardEthRepository),
              ),
            ],
            child: HomeScreen(),
          );
        },
        '/intro': (context) => IntroScreen(),
      },
    );
  }
}
