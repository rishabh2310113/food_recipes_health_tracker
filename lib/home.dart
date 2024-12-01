import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF1F8), 
      body: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), 
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5, 
                width: MediaQuery.of(context).size.width * 0.8,
                color: Colors.black,
                child: const Center(
                  child: Text(
                    'Camera Preview',
                    style: TextStyle(color: Colors.white),
                  ), 
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.history, size: 30, color: Colors.grey),
                onPressed: () {},
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Icon(Icons.camera_alt, size: 30, color: Colors.black),
              ),
              IconButton(
                icon: const Icon(Icons.person, size: 30, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}