import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected_icon.dart';
import 'package:islami/nav_bar_unselected_icon.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          currentIndex = index;
          setState(() {});
        },

        items: [
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(iconName: 'quran'),
            activeIcon: NavBarSelectedIcon(iconName: 'quran'),
            label: 'Quran',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(iconName: 'hadeth'),
            activeIcon: NavBarSelectedIcon(iconName: 'hadeth'),
            label: 'Hadeth',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(iconName: 'sebha'),
            activeIcon: NavBarSelectedIcon(iconName: 'sebha'),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(iconName: 'radio'),
            activeIcon: NavBarSelectedIcon(iconName: 'radio'),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: NavBarUnselectedIcon(iconName: 'time'),
            activeIcon: NavBarSelectedIcon(iconName: 'time'),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
