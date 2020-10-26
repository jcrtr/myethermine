import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myethermine/models/dashboard.dart';


class DashboardApiClient {
  static const baseUrl = 'https://api.ethermine.org';
  final http.Client httpClient;

  DashboardApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Dashboard> fetchDashboard() async {
    final ethUrl = '$baseUrl/miner/0x460a6deec1d52c9c397e92fdc8c4bc05d10f8429/dashboard';
    final ethResponse = await this.httpClient.get(ethUrl);
    if (ethResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final ethJson = jsonDecode(ethResponse.body);
    return Dashboard.fromJson(ethJson);
  }
}
