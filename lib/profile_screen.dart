import 'package:final_project/profile_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String userEmail = "";

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('userEmail') ?? "guest@example.com";
    });
  }

  Future<void> _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear(); 

    Navigator.pushNamedAndRemoveUntil(context, 'signin', (route) => false);
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Logout"),
        content: const Text("Are you sure you want to log out?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel", style: TextStyle(color: Colors.black)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFCC6164),
            ),
            onPressed: () {
              Navigator.pop(context);
              _logout(context);
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC6164),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: SvgPicture.asset(
              'assets/background.svg',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 40),
                   CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey[500],
                    child: const Icon(Icons.person, size: 60, color: Colors.white),
                  ),
                    const SizedBox(width: 16),
                        Text(
                          userEmail,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black54,
                          ),
                        ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuOption(context, Icons.person, "Profile settings"),
                    // _buildMenuOption(context, Icons.health_and_safety, "Health information"),
                    // _buildMenuOption(context, Icons.history, "History"),
                    // _buildMenuOption(context, Icons.settings, "Settings"),
                    _buildMenuOption(context, Icons.privacy_tip, "Privacy policy" , action: () => Navigator.pushNamed(context, '/privacy')),
                    _buildMenuOption(context, Icons.rule, "Terms & conditions" , action: () => Navigator.pushNamed(context, '/terms')),
                    _buildMenuOption(context, Icons.help_outline, "FAQs" , action: () => Navigator.pushNamed(context, '/faqs')),
                    _buildMenuOption(context, Icons.logout, "Log out", action: () => _showLogoutConfirmationDialog(context)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    "NutriTrack\nversion 2.0",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMenuOption(BuildContext context, IconData icon, String title , {VoidCallback? action}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
      onTap: action ??
        () {
          if (title == "Profile settings") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()),
            );
          }
        },
    );
  }
}
