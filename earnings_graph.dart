import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'earnings_data.dart';

class EarningsGraph extends StatelessWidget {
  final List<EarningsData> earningsData;

  EarningsGraph({required this.earningsData});

  List<charts.Series<EarningsData, String>> _createChartData() {
    return [
      charts.Series<EarningsData, String>(
        id: 'Estimated Earnings',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (EarningsData earnings, _) => earnings.date,
        measureFn: (EarningsData earnings, _) => earnings.estimated,
        data: earningsData,
      ),
      charts.Series<EarningsData, String>(
        id: 'Actual Earnings',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (EarningsData earnings, _) => earnings.date,
        measureFn: (EarningsData earnings, _) => earnings.actual,
        data: earningsData,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Earnings Graph')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: charts.BarChart(
          _createChartData(),
          animate: true,
          vertical: false,
        ),
      ),
    );
  }
}
