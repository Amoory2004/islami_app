import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class SelectedRadio extends StatelessWidget {
  int index;
  SelectedRadio({required this.index});
  @override
  Widget build(BuildContext context) {
    final List<String> radioStations = [
      'Radio Ibrahim Al-Akdar',
      'Radio Al-Qaria Yassen',
      'Radio Ahmed Al-trabulsi',
      'Radio Addokali Mohammad ',
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
            left: screenWidth * .16,
            child: Text(
              textAlign: TextAlign.center,
              radioStations[index],
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
