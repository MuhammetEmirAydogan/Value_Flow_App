import 'package:value_flow/models/asset.dart';

class Alert {
  final String id;
  final Asset asset;
  final double targetPrice;
  final bool isPriceAbove;

  Alert({
    required this.id,
    required this.asset,
    required this.targetPrice,
    required this.isPriceAbove,
  });
}