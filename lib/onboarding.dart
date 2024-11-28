import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Discover nutrition instantly',
      'description':
          'Scan any food item to get instant insights into its calories, proteins, fats, and more.',
      'image': 'assets/onboarding1.svg',
    },
    {
      'title': 'Stay healthy and informed',
      'description':
          'Track your intake and make informed food choices for a balanced diet.',
      'image': 'assets/onboarding2.svg',
    },
    {
      'title': 'Your pocket-sized nutrition coach',
      'description':
          'Get tailored recommendations and insights to meet your health goals.',
      'image': 'assets/onboarding3.svg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingPage(
                      title: onboardingData[index]['title']!,
                      description: onboardingData[index]['description']!,
                      image: onboardingData[index]['image']!,
                    );
                  },
                ),
              ),
              SizedBox(
                height: 100,
                child: CustomPaint(
                  painter: CurvePainter(progress: (_currentPage + 1) / onboardingData.length),
                  child: Center(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    if (_currentPage == onboardingData.length - 1) {
                      Navigator.pushReplacementNamed(context, 'signup');
                    } else {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  },
                  child: Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(5, 10),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 30,
                      ),
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
}

class CurvePainter extends CustomPainter {
  final double progress;

  CurvePainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint backgroundPaint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..style = PaintingStyle.stroke // stroke means outline
      ..strokeWidth = 12;

    Paint progressPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke 
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round; // endpoint of the stroke will be round 

    double radius = size.width / 3;
    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi,
      false,  // endpoint ko centre se connect na krega 
      backgroundPaint,
    );

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      pi,
      pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;

  const OnboardingPage({
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          SvgPicture.asset(image, height: 250),
          const SizedBox(height: 30),
          Text(
            description,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
