import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Checkbox(value: true, onChanged: (value) {}),
                const Text('Agree with Terms & Conditions'),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/verify-code');
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
