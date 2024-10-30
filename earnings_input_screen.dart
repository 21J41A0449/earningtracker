import 'package:flutter/material.dart';
import 'earnings_data.dart';
import 'package:company_earnings/earnings_graph.dart';

class EarningsInputScreen extends StatefulWidget {
  @override
  _EarningsInputScreenState createState() => _EarningsInputScreenState();
}

class _EarningsInputScreenState extends State<EarningsInputScreen> {
  final TextEditingController _tickerController = TextEditingController();
  String? _errorMessage;

  void _fetchEarnings() async {
    String ticker = _tickerController.text.trim();
    if (ticker.isEmpty) {
      setState(() {
        _errorMessage = "Please enter a company ticker.";
      });
      return;
    }

    List<EarningsData> earningsData = await fetchEarningsData(ticker);
    if (earningsData.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EarningsGraph(earningsData: earningsData),
        ),
      );
    } else {
      setState(() {
        _errorMessage = "No earnings data found.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Earnings Tracker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _tickerController,
              decoration: InputDecoration(
                labelText: 'Enter Company Ticker',
                errorText: _errorMessage,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchEarnings,
              child: const Text('Get Earnings Data'),
            ),
          ],
        ),
      ),
    );
  }
}
