import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:value_flow/features/asset_detail/widgets/price_chart.dart';
import 'package:value_flow/features/asset_detail/widgets/timeframe_selector.dart';
import 'package:value_flow/models/asset.dart';
import 'package:value_flow/services/api_service.dart';

class AssetDetailScreen extends StatefulWidget {
  final Asset asset;

  const AssetDetailScreen({super.key, required this.asset});

  @override
  State<AssetDetailScreen> createState() => _AssetDetailScreenState();
}

class _AssetDetailScreenState extends State<AssetDetailScreen> {
  final ApiService _apiService = ApiService();

  List<FlSpot>? _chartSpots;
  bool _isChartLoading = true;

  int _selectedTimeframeIndex = 1; // Başlangıçta 7D seçili
  final List<String> _timeframeLabels = ['1D', '7D', '1M', '3M', '1Y', 'ALL'];
  final List<int> _timeframeDays = [1, 7, 30, 90, 365, 4000];

  @override
  void initState() {
    super.initState();
    _fetchChartData();
  }

  Future<void> _fetchChartData() async {
    setState(() {
      _isChartLoading = true;
    });

    try {
      final spots = await _apiService.fetchChartData(
        widget.asset.id,
        _timeframeDays[_selectedTimeframeIndex],
      );
      if (mounted) {
        setState(() {
          _chartSpots = spots;
          _isChartLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isChartLoading = false;
        });
        // İsteğe bağlı: Hata durumunu kullanıcıya göstermek için bir Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load chart data: $e')),
        );
      }
    }
  }

  void _onTimeframeSelected(int index) {
    setState(() {
      _selectedTimeframeIndex = index;
    });
    _fetchChartData();
  }

  @override
  Widget build(BuildContext context) {
    final Color changeColor = widget.asset.priceChangePercentage24h >= 0 ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.asset.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${widget.asset.currentPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '${widget.asset.priceChangePercentage24h.toStringAsFixed(2)}%',
              style: TextStyle(fontSize: 20, color: changeColor, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),

            SizedBox(
              height: 200,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                child: _isChartLoading
                    ? Center(key: UniqueKey(), child: const CircularProgressIndicator())
                    : PriceChart(
                  key: ValueKey(_selectedTimeframeIndex),
                  spots: _chartSpots ?? [],
                ),
              ),
            ),

            const SizedBox(height: 24),
            TimeframeSelector(
              selectedIndex: _selectedTimeframeIndex,
              onTimeframeSelected: _onTimeframeSelected,
              timeframes: _timeframeLabels,
            ),
            const SizedBox(height: 32),
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Theme.of(context).inputDecorationTheme.fillColor,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    '${widget.asset.name} price in the global market. Data provided by CoinGecko.',
                    style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}