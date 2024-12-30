import 'package:flutter/material.dart';
import 'intropages.dart';
import 'sebha.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BottomNavBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Required for async code in main
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? hasSeenOnboarding; // Nullable to handle the initial loading state

  @override
  void initState() {
    super.initState();
    _loadOnboardingStatus();
  }

  Future<void> _loadOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final seenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;
    setState(() {
      hasSeenOnboarding = seenOnboarding;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Show a loading screen while checking the onboarding status
    if (hasSeenOnboarding == null) {
      return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    // After loading, decide which app to show
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: hasSeenOnboarding! ? TasbihScreen() : OnboardingScreen(),
    );
  }
}

