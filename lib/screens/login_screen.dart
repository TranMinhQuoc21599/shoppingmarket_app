import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/color.dart';
import '../constants/labels.dart';
import 'location_access_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo/logo.svg', // Replace with actual SVG path
              height: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              AppLabels.signIn,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: const InputDecoration(labelText: AppLabels.email),
            ),
            const SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: const InputDecoration(labelText: AppLabels.password),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/new-password');
                },
                child: const Text(AppLabels.forgotPassword),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LocationAccessScreen(),
                  ),
                );
              },
              child: const Text(AppLabels.signIn),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(AppLabels.noAccount),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/create-account');
                  },
                  child: const Text(AppLabels.signUp),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Google login
              },
              icon: const Icon(Icons.g_mobiledata),
              label: const Text(AppLabels.googleSignIn),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.secondary,
                foregroundColor: AppColors.buttonText,
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () {
                // Handle Facebook login
              },
              icon: const Icon(Icons.facebook),
              label: const Text(AppLabels.facebookSignIn),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.buttonText,
              ),
            ),
            // The following button is only displayed on iOS devices
            if (Platform.isIOS) ...[
              const SizedBox(height: 10),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle Apple login
                },
                icon: const Icon(Icons.apple),
                label: const Text(AppLabels.appleSignIn),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: AppColors.buttonText,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
