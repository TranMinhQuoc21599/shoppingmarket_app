import 'package:flutter/material.dart';
import 'enter_location_screen.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, size: 80, color: Colors.brown),
            SizedBox(height: 20),
            Text(
              "What is Your Location?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              "We need to know your location in order to suggest nearby services.",
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Handle location access logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text("Allow Location Access"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EnterLocationScreen(),
                  ),
                );
              },
              child: Text(
                "Enter Location Manually",
                style: TextStyle(color: Colors.brown),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
