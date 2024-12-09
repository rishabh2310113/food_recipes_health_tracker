import 'package:final_project/keyboard_screen.dart';
import 'package:final_project/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'result.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   File? _image;
   final picker = ImagePicker();
   List<String> _extractedChips = [];
   bool _isLoading = false;

   Future<void> _pickImage(ImageSource source) async{
    final pickerImage = await picker.pickImage(source: source);
       
     if (pickerImage == null) {
      _showSnackbar('No image selected');
      return;
    }

    setState(() {
      _image = File(pickerImage.path);
    });

    final inputImage = InputImage.fromFilePath(pickerImage.path);
    final textRecognizer = TextRecognizer(script: TextRecognitionScript.latin);

    try {
      final recognizedText = await textRecognizer.processImage(inputImage);
      setState(() {
        _extractedChips = recognizedText.text
            .split('\n')
            .map((line) => line.trim())
            .where((line) => line.isNotEmpty)
            .toList();
      });
    } catch (e) {
      _showSnackbar("Failed to recognize text. Please try again!");
    } finally {
      textRecognizer.close();
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

  void _onChipPressed(String chipText) async{
    setState(() {
      _isLoading = true;
    });
    final url = Uri.parse('https://nutritrack-fk3j.onrender.com/api/nutrition');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({"Food_Name": chipText}),
    );

    setState(() {
      _isLoading = false; 
    });

  if (response.statusCode == 200) {
    final data = json.decode(response.body)['data'];
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultScreen(data: data),
      ),
    );
  } else {
    _showSnackbar("Failed to fetch details. Please try again!");
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFCC6164),
        title: const Text(
          "NutriTrack",
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.black, size: 45,),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
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
              const SizedBox(height: 80),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), 
              child: Container(
                height: MediaQuery.of(context).size.height * 0.56, 
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.transparent,
               child: _image == null? Image.asset(
              'assets/image.jpg',
              fit: BoxFit.cover,
            )
                : Image.file(_image!),
              ),
            ),
          ),
          const SizedBox(height: 16),
              Expanded(
                child: Stack(
                children: [
                SingleChildScrollView(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: _extractedChips
                        .map(
                          (chipText) => ActionChip(
                            label: Text(chipText),
                            onPressed: () => _onChipPressed(chipText),
                          ),
                        )
                        .toList(),
                  ),
                ),
                if (_isLoading)
                      const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.keyboard, size: 35),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const KeyboardScreen()),
                        );
                      },
                    ),
                    ElevatedButton(
                      onPressed: () => _pickImage(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(16),
                      ),
                      child: const Icon(Icons.camera_alt, size: 30, color: Colors.white),
                    ),
                    IconButton(
                      icon: const Icon(Icons.image, size: 35),
                      onPressed: () => _pickImage(ImageSource.gallery),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

