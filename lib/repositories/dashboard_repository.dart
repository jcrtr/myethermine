import 'dart:async';
import 'package:meta/meta.dart';
import 'package:myethermine/models/models.dart';
import 'package:myethermine/repositories/repositories.dart';

class DashboardRepository{
  final DashboardApiClient dashboardApiClient;

  @required
  DashboardRepository({
    this.dashboardApiClient,
  }) : assert(dashboardApiClient != null);

  Future<Dashboard> fetchDashboard() async {
    return await dashboardApiClient.fetchDashboard();
  }

  Future<ErrorMes> fetchDashboardError() async {
    return await dashboardApiClient.fetchDashboardError();
  }
}

class DashboardEthRepository{
  final DashboardEthApiClient dashboardEthApiClient;

  @required
  DashboardEthRepository({
    this.dashboardEthApiClient
  }) : assert(dashboardEthApiClient != null);

  Future<Balance> fetchDashboardEth() async {
    return await dashboardEthApiClient.fetchDashboardEth();
  }
}