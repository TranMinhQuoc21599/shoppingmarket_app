import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatelessWidget {
  const CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Complete Your Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(decoration: const InputDecoration(labelText: 'Name')),
            const SizedBox(height: 10),
            TextField(
              decoration: const InputDecoration(labelText: 'Phone Number'),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'Male', child: Text('Male')),
                DropdownMenuItem(value: 'Female', child: Text('Female')),
              ],
              onChanged: (value) {},
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text('Complete Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
