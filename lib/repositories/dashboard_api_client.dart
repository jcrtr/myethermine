import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myethermine/models/dashboard.dart';

class DashboardApiClient {
  static const _baseUrl = 'https://api.ethermine.org';
  final http.Client httpClient;

  DashboardApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Dashboard> fetchDashboard() async {
    final ethUrl = '$_baseUrl/miner/710046eCa590620f87e7946993B8E8BC7eb4b222/currentStats';
    final ethResponse = await this.httpClient.get(ethUrl);
    if (ethResponse.statusCode != 200) {
      throw Exception('error getting locationId for city');
    }

    final ethJson = jsonDecode(ethResponse.body);
    return Dashboard.fromJson(ethJson);
  }
}
