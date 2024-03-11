import 'package:flutter/material.dart';
import '../data/names.dart'; // Import the names file

class DynamicPage extends StatelessWidget {
  final Name name;

  DynamicPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${name.name} Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ID: ${name.id}'),
            Text('Name: ${name.name}'),
            // Add more widgets to render additional details if needed
          ],
        ),
      ),
    );
  }
}
