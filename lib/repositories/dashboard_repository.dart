import 'dart:async';

import 'package:meta/meta.dart';

import 'package:myethermine/models/models.dart';
import 'package:myethermine/repositories/repositories.dart';

class DashboardRepository{
  final DashboardApiClient dashboardApiClient;

  DashboardRepository({
    @required this.dashboardApiClient
  }) : assert(dashboardApiClient != null);

  Future<Dashboard> fetchDashboard() async {
    return await dashboardApiClient.fetchDashboard();
  }
}