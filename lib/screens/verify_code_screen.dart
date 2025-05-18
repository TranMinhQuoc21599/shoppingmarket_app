import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Verify Code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text('Please enter the code sent to your email'),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Enter Code'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/complete-profile');
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
