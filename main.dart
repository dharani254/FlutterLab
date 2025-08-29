import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Add this dependency in pubspec.yaml

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileCard(),
    );
  }
}

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool isFollowing = false; // state for button

  // Functions to launch phone & email
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: "tel", path: "+919440049565");
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: "mailto",
      path: "dharani@example.com",
      query: "subject=Hello&body=Hi Dharani,", // optional
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Profile picture
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
            const SizedBox(height: 15),

            // Name
            const Text(
              "Dharani Kandiboyina",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Role
            Text(
              "Flutter Developer",
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue[200],
                letterSpacing: 2,
              ),
            ),

            const SizedBox(height: 20),

            // Divider
            SizedBox(
              width: 200,
              child: Divider(color: Colors.blue[100]),
            ),

            // Contact cards
            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blue),
                title: const Text("+91 9440049565"),
                onTap: _launchPhone, // 📞 open dialer
              ),
            ),

            Card(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text("dharani@example.com"),
                onTap: _launchEmail, // 📧 open email
              ),
            ),

            const SizedBox(height: 20),

            // Follow button
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  isFollowing = !isFollowing;
                });
              },
              icon: Icon(isFollowing ? Icons.check : Icons.person_add),
              label: Text(isFollowing ? "Following" : "Follow"),
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    isFollowing ? Colors.green : Colors.blue[400],
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
