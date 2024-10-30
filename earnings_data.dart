import 'dart:convert';
import 'package:http/http.dart' as http;

class EarningsData {
  final String date;
  final double estimated;
  final double actual;

  EarningsData({required this.date, required this.estimated, required this.actual});

  factory EarningsData.fromJson(Map<String, dynamic> json) {
    return EarningsData(
      date: json['date'],
      estimated: json['estimated']?.toDouble() ?? 0.0, // Ensure we get a double
      actual: json['actual']?.toDouble() ?? 0.0, // Ensure we get a double
    );
  }
}

Future<List<EarningsData>> fetchEarningsData(String ticker) async {
  final response = await http.get(
    Uri.parse('https://api-ninjas.com/api/earningscalendar?ticker=$ticker'),
    headers: {
      'X-Api-Key': 'YOUR_API_KEY', // Replace with your actual API key
    },
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    // Check if data is empty
    if (data.isEmpty) {
      print("No earnings data found for the ticker: $ticker");
    }
    return data.map((json) => EarningsData.fromJson(json)).toList();
  } else {
    print('Failed to load earnings data: ${response.statusCode}');
    print('Response body: ${response.body}');
    throw Exception('Failed to load earnings data');
  }
}
