import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'links_data.dart';

void main() {
  runApp(const BestVerifierApp());
}

class BestVerifierApp extends StatelessWidget {
  const BestVerifierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Best Verifier',
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

  // --- LOGIC: Send Email (Fixed for special characters) ---
  Future<void> _sendFeedback() async {
    final String subject = Uri.encodeComponent(emailSubject);
    final String body = Uri.encodeComponent("Hi, I have a suggestion for Best Verifier:\n\n");
    final Uri emailLaunchUri = Uri.parse("mailto:$contactEmail?subject=$subject&body=$body");

    try {
      if (!await launchUrl(emailLaunchUri)) {
        debugPrint('Could not launch email client');
      }
    } catch (e) {
      debugPrint('Error launching email: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'),
          ),
          title: const Text('Best Verifier', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          backgroundColor: const Color(0xFF0D47A1),
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.mail_outline, color: Colors.white),
              tooltip: 'Send Suggestion',
              onPressed: _sendFeedback,
            ),
            const SizedBox(width: 10),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            indicatorColor: Color(0xFFFF9933),
            indicatorWeight: 4,
            tabs: [
              Tab(icon: Icon(Icons.travel_explore), text: "VERIFY OTHERS"),
              Tab(icon: Icon(Icons.folder_shared), text: "MY DOCUMENTS"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CategoryGrid(mode: 'verify'),
            CategoryGrid(mode: 'personal'),
          ],
        ),
      ),
    );
  }
}

class CategoryGrid extends StatelessWidget {
  final String mode;

  const CategoryGrid({super.key, required this.mode});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // --- LEGAL DISCLAIMER ---
        if (mode == 'verify') 
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(color: Colors.amber.shade800),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.info_outline, color: Colors.amber, size: 20),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "DISCLAIMER: 'Best Verifier' is a private utility tool. We are NOT affiliated with any Government entity. All links open official public websites.",
                    style: TextStyle(fontSize: 11, color: Colors.brown.shade800),
                  ),
                ),
              ],
            ),
          ),

        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            mode == 'verify' 
                ? "Select a category to investigate" 
                : "Manage your personal documents",
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ),
        const SizedBox(height: 10),
        
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

        // --- PRIVACY FOOTER ---
        Container(
          padding: const EdgeInsets.all(12),
          color: Colors.grey.shade200,
          width: double.infinity,
          child: const Text(
            "Privacy: We do not store or sync any user data.",
            style: TextStyle(fontSize: 10, color: Colors.grey),
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

    Color cardColor = Color(category['color'] ?? 0xFF2196F3);

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
              backgroundColor: cardColor.withOpacity(0.1),
              child: Icon(iconData, size: 35, color: cardColor),
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
      ),
    );
  }

  void _showToolList(BuildContext context, Map<String, dynamic> category) {
    final List<Map<String, String>> tools = 
        (category[mode] as List<dynamic>).map((e) => Map<String, String>.from(e)).toList();

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(width: 40, height: 5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 20),
            
            Text(
              "${category['title']} (${mode == 'verify' ? 'Verify' : 'My Docs'})", 
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 20),
            
            Expanded(
              child: ListView(
                children: tools.map((tool) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  elevation: 0,
                  color: mode == 'verify' ? Colors.blue.shade50 : Colors.orange.shade50,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(color: mode == 'verify' ? Colors.blue.shade100 : Colors.orange.shade100),
                  ),
                  child: ListTile(
                    title: Text(tool['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(tool['desc']!, style: const TextStyle(fontSize: 12)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14, color: mode == 'verify' ? Colors.blue : Colors.orange),
                    onTap: () => _handleLinkClick(context, tool['url']!),
                  ),
                )).toList(),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- CONSENT POPUP LOGIC ---
  void _handleLinkClick(BuildContext context, String url) {
    if (mode == 'personal') {
      _launchURL(url);
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Consent Required"),
        content: const Text("I confirm that I have the explicit consent of the individual to verify this document."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); 
              _launchURL(url); 
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), foregroundColor: Colors.white),
            child: const Text("I Agree & Proceed"),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
