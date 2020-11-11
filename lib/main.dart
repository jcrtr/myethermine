import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';

import 'package:myethermine/utils/bloc_observer.dart';
import 'repositories/repositories.dart';
import 'app.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final DashboardEthRepository dashboardEthRepository = DashboardEthRepository(
    dashboardEthApiClient: DashboardEthApiClient(
      httpClient: http.Client(),
    ),
  );

  final DashboardRepository dashboardRepository = DashboardRepository(
    dashboardApiClient: DashboardApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(
    // DevicePreview(
    //   // enabled: !kReleaseMode,
    //   // toolBarStyle: DevicePreviewToolBarStyle.light(),
    //   builder: (context) => App(
    //     dashboardEthRepository: dashboardEthRepository,
    //     dashboardRepository: dashboardRepository,
    //   ),
    // ),
    App(
      dashboardEthRepository: dashboardEthRepository,
      dashboardRepository: dashboardRepository,
    ),
  );
}
