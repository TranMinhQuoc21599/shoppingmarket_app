import 'package:flutter/material.dart';
import 'location_access_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simulate sign-in logic
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationAccessScreen(),
                  ),
                );
              },
              child: Text("Sign In"),
            ),
            TextButton(
              onPressed: () {
                // Handle forgot password logic
              },
              child: Text("Forgot Password?"),
            ),
          ],
        ),
      ),
    );
  }
}
