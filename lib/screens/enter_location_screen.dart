import 'package:flutter/material.dart';

import 'home_screen_screen.dart';

class EnterLocationScreen extends StatelessWidget {
  const EnterLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.brown),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Enter Your Location",
          style: TextStyle(color: Colors.brown),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search location",
                prefixIcon: Icon(Icons.search, color: Colors.brown),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear, color: Colors.grey),
                  onPressed: () {},
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.my_location, color: Colors.brown),
              title: Text("Use my current location"),
              onTap: () {
                // Handle current location logic
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.brown),
              title: Text("Golden Avenue"),
              subtitle: Text("8502 Preston Rd, Ingl."),
              onTap: () {
                // Handle location selection
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text("Go to Home Screen"),
            ),
          ],
        ),
      ),
    );
  }
}
