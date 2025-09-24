import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:value_flow/models/asset.dart';

class ApiService {
  final String _baseUrl = "https://api.coingecko.com/api/v3";
  final String _apiKey = dotenv.env['COINGECKO_API_KEY'] ?? '';

  Future<List<Asset>> fetchMarketData() async {
    final url = Uri.parse(
        '$_baseUrl/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false&x_cg_demo_api_key=$_apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Asset.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load market data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to connect to the server: $e');
    }
  }

  Future<List<FlSpot>> fetchChartData(String assetId, int days) async {
    final url = Uri.parse(
        '$_baseUrl/coins/$assetId/market_chart?vs_currency=usd&days=$days&x_cg_demo_api_key=$_apiKey');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> prices = data['prices'];

        List<FlSpot> spots = [];
        for (var i = 0; i < prices.length; i++) {
          final priceData = prices[i] as List<dynamic>;
          spots.add(FlSpot(i.toDouble(), priceData[1] as double));
        }
        return spots;
      } else {
        throw Exception('Failed to load chart data');
      }
    } catch (e) {
      throw Exception('Failed to connect for chart data: $e');
    }
  }
}