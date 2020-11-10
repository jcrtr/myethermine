import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:myethermine/models/models.dart';

class DashboardEthApiClient {
  static const _baseUrl = 'https://api.etherscan.io';
  static const _address = '0x460a6deec1d52c9c397e92fdc8c4bc05d10f8429';
  static const _token = '9P6S4MISQ9AQ7YDWJAR4T4HS7D43WPZ9H9';

  final http.Client httpClient;

  DashboardEthApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Balance> fetchDashboardEth() async {
    print('1');
    final ethUrl = '$_baseUrl/api?module=account&action=balance&address=$_address&tag=latest&apikey=$_token';
    print('2');
    final ethResponse = await this.httpClient.get(ethUrl);
    if (ethResponse.statusCode != 200) {
      throw Exception('Error server');
    }

    final ethJson = jsonDecode(ethResponse.body);
    print(Balance.fromJson(ethJson));
    return Balance.fromJson(ethJson);
  }
}