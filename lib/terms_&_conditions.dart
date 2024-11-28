import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions"),
        backgroundColor: const Color(0xFFE55353), 
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Effective Date: 19-11-2024\n\n"
                "1. Information We Collect\n"
                "We collect the following types of data:\n"
                "- Personal Information: Name, email, phone number (provided during registration).\n"
                "- Usage Data: Device information, app activity, and interactions.\n"
                "- Content: Photos, videos, and messages you post or share.\n\n"
                "2. How We Use Your Information\n"
                "We use your information to:\n"
                "- Provide and improve app functionality.\n"
                "- Personalize your experience.\n"
                "- Monitor and prevent abuse.\n"
                "- Communicate updates and promotional offers.\n\n"
                "3. Data Sharing\n"
                "We do not sell or share your personal data with third parties, except:\n"
                "- With your consent.\n"
                "- To comply with legal obligations.\n"
                "- To service providers assisting with app operations (bound by confidentiality agreements).\n\n"
                "4. Cookies and Tracking Technologies\n"
                "We use cookies to enhance your experience. You can manage cookie settings in your browser.\n\n"
                "5. Data Security\n"
                "We use industry-standard measures to protect your information. However, no method of transmission over the internet is 100% secure.\n\n"
                "6. Your Rights\n"
                "Depending on your location, you may have the right to:\n"
                "- Access, update, or delete your data.\n"
                "- Object to data processing.\n\n"
                "7. Children’s Privacy\n"
                "Hola does not knowingly collect data from users under 13. Accounts of underage users will be terminated upon discovery.\n\n"
                "8. Policy Updates\n"
                "We may update this Privacy Policy from time to time. Changes will be communicated through the app.\n\n"
                "9. Contact Us\n"
                "For questions or concerns, contact us at:\n"
                "- Email: support@holaapp.com\n"
                "- Address: 123 Innovation Street, Suite 456, Tech City, CA 94016, India\n",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
