import 'package:flutter/material.dart';
import 'earnings_input_screen.dart';

void main() => runApp(EarningsTrackerApp());

class EarningsTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Earnings Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EarningsInputScreen(),
    );
  }
}
