// Placeholder for screens
import 'package:flutter/material.dart';

class PlaceholderScreen extends StatelessWidget {
  const PlaceholderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Placeholder Screen')),
      body: const Center(child: Text('This is a placeholder screen.')),
    );
  }
}
