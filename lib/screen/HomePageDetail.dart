import 'package:flutter/material.dart';

class TodoDetailScreen extends StatelessWidget {
  final String title;
  final String date;
  const TodoDetailScreen({super.key, required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo Detail"),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              this.title,
              style: TextStyle(fontSize: 28),
            ),
          ),
          Container(
            child: Text(
              this.date,
              style: TextStyle(fontSize: 28),
            ),
          ),
        ],
      ),
    );
  }
}
