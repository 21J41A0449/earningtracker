import 'package:flutter/material.dart';

class TranscriptScreen extends StatelessWidget {
  final String transcript;

  TranscriptScreen({required this.transcript});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Earnings Transcript')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Text(transcript),
        ),
      ),
    );
  }
}
