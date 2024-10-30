import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchEarningsTranscript(String date) async {
  // Replace this with actual API endpoint and parameters
  final response = await http.get(Uri.parse('https://api-ninjas.com/api/earningscalltranscript?date=$date'));

  if (response.statusCode == 200) {
    Map<String, dynamic> data = jsonDecode(response.body);
    return data['transcript'];
  } else {
    throw Exception('Failed to load earnings transcript');
  }
}
