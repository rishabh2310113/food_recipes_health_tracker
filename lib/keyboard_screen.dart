// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'result.dart';

// class KeyboardScreen extends StatefulWidget {
//   const KeyboardScreen({super.key});

//   @override
//   State<KeyboardScreen> createState() => _KeyboardScreenState();
// }

// class _KeyboardScreenState extends State<KeyboardScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isLoading = false;

//   Future<void> _fetchNutritionData(String query) async {
//     if (query.isEmpty) {
//       _showSnackbar('Please enter a valid food name');
//       return;
//     }

//     setState(() {
//       _isLoading = true;
//     });

//     try {
//       final url = Uri.parse('https://nutritrack-fk3j.onrender.com/api/nutrition');
//       final response = await http.post(
//         url,
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({"Food_Name": query}),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body)['data'];
//         _searchController.clear();
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ResultScreen(data: data),
//           ),
//         );
//       } else {
//         _showSnackbar('No details found for the entered food name.');
//       }
//     } catch (e) {
//       _showSnackbar('Failed to fetch data. Please try again.');
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _showSnackbar(String message) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(message),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFCC6164), 
//         elevation: 0,
//         title: const Text(
//           "NutriTrack",
//           style: TextStyle(
//             color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         centerTitle: false,
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: SvgPicture.asset(
//               'assets/background.svg',
//               fit: BoxFit.cover,
//             ),
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: TextField(
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.white,
//                     prefixIcon: const Icon(Icons.search, color: Colors.black),
//                     hintText: "Search...",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(30),
//                       borderSide: BorderSide.none,
//                     ),
//                     contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Center(
//                 child: ElevatedButton(
//                   onPressed: () {
//                     _fetchNutritionData(_searchController.text.trim());
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.black,
//                     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                   ),
//                   child: const Text(
//                     'Search',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Spacer(),
//                 SizedBox(height: 20),
//                 Text(
//                   "Hi there!\nHow can I assist you today?",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Spacer(),
//               ],
//             ),
//           ),
//           if (_isLoading)
//             Container(
//               color: Colors.black.withOpacity(0.5),
//               child: const Center(
//                 child: CircularProgressIndicator(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'result.dart';

class KeyboardScreen extends StatefulWidget {
  const KeyboardScreen({super.key});

  @override
  _KeyboardScreenState createState() => _KeyboardScreenState();
}

class _KeyboardScreenState extends State<KeyboardScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _isLoading = false;

  Future<void> _fetchNutritionData(String query) async {
    if (query.isEmpty) {
      _showSnackbar('Please enter a valid food name');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse('https://nutritrack-fk3j.onrender.com/api/nutrition');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({"Food_Name": query}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];

        // Clear the text field before navigating
        _searchController.clear();

        // Navigate to ResultScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(data: data),
          ),
        );
      } else {
        _showSnackbar('No details found for the entered food name.');
      }
    } catch (e) {
      _showSnackbar('Failed to fetch data. Please try again.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC6164), // Set the background color
        elevation: 0, // Remove shadow
        title: const Text(
          "NutriTrack",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: false,
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    prefixIcon: const Icon(Icons.search, color: Colors.black),
                    hintText: "Search...",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 16.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    _fetchNutritionData(_searchController.text.trim());
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(), // Push content slightly below the center
                // Image.asset(
                //   'assets/assistant_logo.jpg', // Replace with the correct path to your image file
                //   height: 200,
                //   width: 300,
                // ),
                SizedBox(height: 20),
                Text(
                  "Hi there!\nHow can I assist you today?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Spacer(), // Add space at the bottom
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: const Center(
                child: CircularProgressIndicator(
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
