import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart'; // To open browser
import 'links_data.dart'; // Importing your "Brain"

void main() {
  runApp(const BharatVerifyApp());
}

class BharatVerifyApp extends StatelessWidget {
  const BharatVerifyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bharat Verify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1A73E8),
          brightness: Brightness.light,
        ),
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Bharat Verify", style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a category to verify",
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.grey[700]),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCard(context, "Identity", Icons.person_outline, Colors.blue, "Aadhaar, Voter ID"),
                  _buildCard(context, "Business", Icons.store_outlined, Colors.orange, "GST, MSME"),
                  _buildCard(context, "Assets", Icons.directions_car_outlined, Colors.green, "Vehicle RC, DL"),
                  _buildCard(context, "Finance", Icons.account_balance_wallet_outlined, Colors.purple, "PAN, ITR"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // Navigate to the list of links for this category
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryListScreen(categoryName: title)),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: 15),
              Text(title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 5),
              Text(subtitle, textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[500])),
            ],
          ),
        ),
      ),
    );
  }
}

// --- NEW SCREEN: Shows the list of links for a chosen category ---
class CategoryListScreen extends StatelessWidget {
  final String categoryName;

  const CategoryListScreen({super.key, required this.categoryName});

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. Filter the "Brain" to find links for this category
    final categoryLinks = verificationLinks.where((item) => item['category'] == categoryName).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(categoryName, style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
          itemCount: categoryLinks.length,
          itemBuilder: (context, index) {
            final linkData = categoryLinks[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              elevation: 0,
              child: ListTile(
                contentPadding: const EdgeInsets.all(20),
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1), borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.link, color: Colors.blue),
                ),
                title: Text(linkData['title']!, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 16)),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(linkData['instruction']!, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600])),
                ),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  _launchURL(linkData['url']!);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
