import 'package:flutter/material.dart';
import 'package:islami/nav_bar_selected_icon.dart';
import 'package:islami/nav_bar_unselected_icon.dart';
import 'package:islami/tabs/hadeth_tab.dart';
import 'package:islami/tabs/quran_tab.dart';
import 'package:islami/tabs/radio_tab.dart';
import 'package:islami/tabs/sebha_tab.dart';
import 'package:islami/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];

  List<String> backgroundNames = [
    'quran_background',
    'hadeth_background',
    'sebha_background',
    'radio_background',
    'time_background',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/${backgroundNames[currentIndex]}.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Image.asset(
              'assets/images/header.png',
              height: MediaQuery.sizeOf(context).height * .17,
            ),
            tabs[currentIndex],
          ],
        ),
      ),
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
