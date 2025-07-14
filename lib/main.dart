import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/onboarding_screens.dart';
import 'package:islami/quran/quran_service%20.dart';
import 'package:islami/quran/sura_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  QuranService.getMostRecentlySuras();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: hasSeenOnboarding(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const MaterialApp(
            home: Scaffold(body: Center(child: CircularProgressIndicator())),
            debugShowCheckedModeBanner: false,
          );
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            HomeScreen.routeName: (_) => HomeScreen(),
            SuraDetails.routeName: (_) => SuraDetails(),
            HadethDetailsScreen.routeName: (_) => HadethDetailsScreen(),
            OnboardingScreens.routeName: (_) => OnboardingScreens(),
          },
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.dark,
          home: snapshot.data == true ? HomeScreen() : OnboardingScreens(),
        );
      },
    );
  }

  Future<bool> hasSeenOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_seen') ?? false;
  }
}
