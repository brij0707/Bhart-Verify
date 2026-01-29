import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'links_data.dart'; // Imports your new data structure

void main() {
  runApp(const BharatVerifyApp());
}

class BharatVerifyApp extends StatelessWidget {
  const BharatVerifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bharat Verify',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
        textTheme: GoogleFonts.poppinsTextTheme(),
        primaryColor: const Color(0xFF0D47A1),
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Function to handle Email Logic
  Future<void> _sendFeedback() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: contactEmail, // Fetches from links_data.dart
      queryParameters: {
        'subject': emailSubject,
        'body': 'Hi, I have a suggestion/feedback for Bharat Verify:\n\n'
      },
    );

    if (!await launchUrl(emailLaunchUri)) {
      debugPrint('Could not launch email client');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Two tabs: Verify vs Personal
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bharat Verify', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: const Color(0xFF0D47A1),
          elevation: 0,
          centerTitle: true,
          
          // --- NEW CONTACT BUTTON ---
          actions: [
            IconButton(
              icon: const Icon(Icons.mail_outline, color: Colors.white),
              tooltip: 'Send Suggestion',
              onPressed: _sendFeedback,
            ),
            const SizedBox(width: 10),
          ],
          
          // --- TABS ---
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Color(0xFFFF9933), // Saffron Indicator
            indicatorWeight: 4,
            tabs: [
              Tab(icon: Icon(Icons.travel_explore), text: "VERIFY OTHERS"),
              Tab(icon: Icon(Icons.folder_shared), text: "MY DOCUMENTS"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            // Tab 1: Verify Mode (Blue Theme)
            CategoryGrid(mode: 'verify'),
            // Tab 2: Personal Mode (Orange Theme)
            CategoryGrid(mode: 'personal'),
          ],
        ),
      ),
    );
  }
}

// --- Reusable Grid Component ---
class CategoryGrid extends StatelessWidget {
  final String mode; // 'verify' or 'personal'

  const CategoryGrid({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            mode == 'verify' 
                ? "Select a category to investigate" 
                : "Manage your personal documents",
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 20),
        
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
              children: gridCategories.entries.map((entry) {
                return _buildGridCard(context, entry.value);
              }).toList(),
            ),
          ),
        ),

        // Disclaimer Footer
        Container(
          padding: const EdgeInsets.all(16),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: const Text(
            "Disclaimer: We do not store any data. This app connects you to official Government portals.",
            style: TextStyle(fontSize: 11, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildGridCard(BuildContext context, Map<String, dynamic> category) {
    IconData iconData;
    switch (category['icon']) {
      case 'directions_car': iconData = Icons.directions_car; break;
      case 'store': iconData = Icons.store; break;
      case 'account_balance_wallet': iconData = Icons.account_balance_wallet; break;
      default: iconData = Icons.person;
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () => _showToolList(context, category),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: Color(category['color']).withOpacity(0.1),
              child: Icon(iconData, size: 35, color: Color(category['color'])),
            ),
            const SizedBox(height: 15),
            Text(
              category['title'].split(" & ")[0],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              category['title'].split(" & ").length > 1 ? category['title'].split(" & ")[1] : "",
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
