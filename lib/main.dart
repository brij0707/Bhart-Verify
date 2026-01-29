import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'links_data.dart'; 

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

  // --- UPDATED EMAIL LOGIC (No More + Signs) ---
  Future<void> _sendFeedback() async {
    // We manually encode spaces as %20 to prevent '+' signs
    final String subject = Uri.encodeComponent(emailSubject);
    final String body = Uri.encodeComponent("Hi, I have a suggestion for Bharat Verify:\n\n");
    
    // Construct the manual link
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
          // LOGO
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/logo.png'), 
          ),
          title: const Text('Bharat Verify', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
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
                    onTap: () => _launchURL(tool['url']!),
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

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
}
