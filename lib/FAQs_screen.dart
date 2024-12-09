import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final List<bool> _expandedSections = [true, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC6164),
        title: const Text(
          'FAQs',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background SVG
          SizedBox.expand(
            child: SvgPicture.asset(
              'assets/background.svg', // Replace with your SVG path
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // General Questions Section
                  _buildFAQSection(
                    "General Questions",
                    """
Q1: What is NutriTrack?
A: NutriTrack is a nutrition-tracking app that scans food names and provides detailed nutritional information, including calories, macronutrients, and other key details.

Q2: How does NutriTrack work?
A: You can either scan the food item using the app's scanner or manually type its name. NutriTrack then retrieves detailed nutrition data from its database.

Q3: Is NutriTrack free to use?
A: Yes, NutriTrack offers a free version with essential features. Premium plans with advanced features may be available for additional benefits.

Q4: Which devices is NutriTrack compatible with?
A: NutriTrack works on both Android and iOS devices.
                    """,
                    0,
                  ),
                  _buildFAQSection("Features and Usage", "Details about features and usage go here.", 1),
                  _buildFAQSection("Data and Accuracy", "Details about data and accuracy go here.", 2),
                  _buildFAQSection("Privacy and Support", "Details about privacy and support go here.", 3),
                  _buildFAQSection("Additional Features", "Details about additional features go here.", 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQSection(String title, String content, int index) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ExpansionPanelList(
        elevation: 1,
        expandedHeaderPadding: EdgeInsets.zero,
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            _expandedSections[index] = !isExpanded;
          });
        },
        children: [
          ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                title: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                content,
                style: const TextStyle(fontSize: 14),
              ),
            ),
            isExpanded: _expandedSections[index],
          ),
        ],
      ),
    );
  }
}
