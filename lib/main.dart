import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          seedColor: const Color(0xFF1A73E8), // Professional Blue
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
      backgroundColor: const Color(0xFFF5F5F5), // Light Grey Background
      appBar: AppBar(
        title: Text(
          "Bharat Verify",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
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
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 20),
            // The Grid of Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2, // 2 Buttons per row
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _buildCard(
                    context, 
                    "Identity", 
                    Icons.person_outline, 
                    Colors.blue, 
                    "Aadhaar, Voter ID"
                  ),
                  _buildCard(
                    context, 
                    "Business", 
                    Icons.store_outlined, 
                    Colors.orange, 
                    "GST, MSME"
                  ),
                  _buildCard(
                    context, 
                    "Assets", 
                    Icons.directions_car_outlined, 
                    Colors.green, 
                    "Vehicle RC, DL"
                  ),
                  _buildCard(
                    context, 
                    "Finance", 
                    Icons.account_balance_wallet_outlined, 
                    Colors.purple, 
                    "PAN, Bank"
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // A helper function to design one card so we don't repeat code
  Widget _buildCard(BuildContext context, String title, IconData icon, Color color, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            // We will add the logic here later
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Opening $title verification...")),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 30, color: color),
              ),
              const SizedBox(height: 15),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
