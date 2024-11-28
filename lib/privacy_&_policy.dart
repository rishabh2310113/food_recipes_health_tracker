import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy & Policy"),
        backgroundColor: const Color(0xFFE55353),
      ),
      body: const Padding(
        padding:  EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. Acceptance of Terms\n"
                "By downloading, accessing, or using the Hola app, you agree to these Terms and Conditions and our Privacy Policy. If you do not agree, do not use the app.\n\n"
                "2. Eligibility\n"
                "You must be at least 13 years old to use the app. By using the app, you confirm that you meet the age requirement and have the legal capacity to agree to these terms.\n\n"
                "3. Account Registration\n"
                "You are responsible for maintaining the confidentiality of your login credentials.\n"
                "You agree to provide accurate, complete, and updated information.\n"
                "Hola reserves the right to terminate accounts that provide false information or violate our policies.\n\n"
                "4. User Conduct\n"
                "- Post or share content that is illegal, abusive, hateful, or violates the rights of others.\n"
                "- Use the app for any unauthorized or unlawful purpose.\n"
                "- Impersonate others or misrepresent your identity.\n"
                "Hola reserves the right to suspend or terminate accounts that violate these rules.\n\n"
                "5. Content Ownership\n"
                "You retain ownership of the content you post.\n"
                "By posting, you grant Hola a worldwide, royalty-free license to use, display, and share your content within the app.\n\n"
                "6. Privacy and Data\n"
                "Your use of the app is subject to our Privacy Policy. We are committed to protecting your personal information.\n\n"
                "7. Termination\n"
                "Hola may suspend or terminate your access to the app at any time without notice for violating these terms.\n\n"
                "8. Liability Disclaimer\n"
                "Hola is provided on an 'as-is' basis. We do not guarantee uninterrupted service or error-free functionality.\n\n"
                "9. Changes to Terms\n"
                "Hola reserves the right to update these Terms at any time. Continued use of the app constitutes acceptance of the updated terms.\n",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
