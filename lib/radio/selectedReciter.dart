import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class Selectedreciter extends StatelessWidget {
  int index;
  Selectedreciter({required this.index});
  @override
  Widget build(BuildContext context) {
    final List<String> reciters = [
      'Ibrahim Al-Akdar',
      'Akram Alalaqmi',
      'Majed Al-Enezi',
      'Malik shaibat ',
      'Al-Qaria Yassen',
      'Ahmed Al-trabulsi',
    ];
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Container(
      height: screenHeight * .15,
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset('assets/images/selected_item_background.png'),
          ),
          Positioned(
            top: 20,
            left: screenWidth * .3,
            child: Text(
              textAlign: TextAlign.center,
              reciters[index],
              style: textTheme.titleLarge!.copyWith(color: AppTheme.black),
            ),
          ),
          Positioned(
            bottom: 10,
            right: screenWidth * .29,
            child: index == 1
                ? Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.pause,
                          size: 44,
                          color: AppTheme.black,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_off,
                          size: 40,
                          color: AppTheme.black,
                        ),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
                          size: 44,
                          color: AppTheme.black,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,

                        onPressed: () {},
                        icon: Icon(
                          Icons.volume_up,
                          size: 40,
                          color: AppTheme.black,
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
