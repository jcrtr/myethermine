import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myethermine/models/models.dart';


class DashboardApiClient {
  static const _baseUrl = 'https://api.ethermine.org/miner';
  final http.Client httpClient;

  DashboardApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Dashboard> fetchDashboard() async {
    final ethUrl = '$_baseUrl/0x460a6deec1d52c9c397e92fdc8c4bc05d10f8429/currentStats';
    final ethResponse = await this.httpClient.get(ethUrl);
    if (ethResponse.statusCode != 200) {
      throw Exception('Error server');
    }

    final ethJson = jsonDecode(ethResponse.body);
    return Dashboard.fromJson(ethJson);
  }

  Future<ErrorMes> fetchDashboardError() async {
    final ethUrl = '$_baseUrl/0x460a6deec1d52c9c397e92fdc8c4bc05d10f8429/currentStats';
    final ethResponse = await this.httpClient.get(ethUrl);
    if (ethResponse.statusCode != 200) {
      throw Exception('Error server');
    }

    final ethJson = jsonDecode(ethResponse.body);
    return ErrorMes.fromJson(ethJson);
  }
}