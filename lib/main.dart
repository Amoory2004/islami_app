import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/home_screen.dart';
import 'package:islami/quran/quran_service%20.dart';
import 'package:islami/quran/sura_details.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  QuranService.getMostRecentlySuras();
  runApp(IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(),
        SuraDetails.routeName: (_) => SuraDetails(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
