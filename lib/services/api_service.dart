import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:value_flow/models/asset.dart';

class ApiService {
  final String _baseUrl = "https://api.coingecko.com/api/v3";
  final String _apiKey = dotenv.env['COINGECKO_API_KEY'] ?? 'default_key';

  Future<List<Asset>> fetchMarketData() async {
    final url = Uri.parse(
        '$_baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&x_cg_demo_api_key=$_apiKey');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<Asset> assets = data.map((json) => Asset.fromJson(json)).toList();
        return assets;
      } else {
        throw Exception('Failed to load market data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }
}