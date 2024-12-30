import 'package:flutter/material.dart';
import 'sebha.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> _onboardingData = [
    {
      "image": "assets/image/Group (1).png",
      "title": "Welcome To Islami App",
      "description": "",
    },
    {
      "image": "assets/image/mosque.png",
      "title": "Welcome To Islami",
      "description": "We Are Very Excited To Have You In Our Community.",
    },
    {
      "image": "assets/image/quran.png",
      "title": "Reading the Quran",
      "description": "Read, and your Lord is the Most Generous.",
    },


    {
      "image": "assets/image/dua.png",
      "title": "Bearish",
      "description": "Praise the name of your Lord, the most High",
    },


    {
      "image": "assets/image/ mic.png",
      "title": "Holy Quran Radio",
      "description": "You can listen to the Holy Quran Radio through the application easily and for free",
    },




  ];

  void _goToNextPage() async{
    if (_currentPage < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('hasSeenOnboarding', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  TasbihScreen()),
      );
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void completeOnboarding(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TasbihScreen()),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff202020),
      body: Column(
        children: [
          // Fixed Logo
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Image.asset(
              "assets/image/Group 31.png", // Logo asset path
              height: 150,

            ),
          ),
          // PageView in Expanded to handle remaining space
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return OnboardingSlide(
                      image: _onboardingData[index]["image"]!,
                      title: _onboardingData[index]["title"]!,
                      description: _onboardingData[index]["description"]!,
                    );
                  },
                ),
                // Navigation Buttons
                Positioned(
                  bottom: 30,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back Button
                      if (_currentPage > 0)
                        TextButton(
                          onPressed: _goToPreviousPage,
                          child: const Text(
                            "Back",
                            style: TextStyle(
                                color: Color(0xffE2BE7F), fontSize: 16),
                          ),
                        )
                      else
                        const SizedBox(width: 60), // Placeholder for alignment
                      // Dots Indicator
                      Row(
                        children: List.generate(
                          _onboardingData.length,
                              (index) => AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            height: 10,
                            width: _currentPage == index ? 20 : 10,
                            decoration: BoxDecoration(
                              color: _currentPage == index
                                  ? const Color(0xffE2BE7F)
                                  : Colors.grey.shade700,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      // Next Button
                      TextButton(
                        onPressed: _goToNextPage,
                        child: Text(
                          _currentPage == _onboardingData.length - 1
                              ? "Start"
                              : "Next",
                          style: const TextStyle(
                              color: Color(0xffE2BE7F), fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Onboarding Slide Widget
class OnboardingSlide extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingSlide({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 250),
        const SizedBox(height: 20),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xffE2BE7F),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

