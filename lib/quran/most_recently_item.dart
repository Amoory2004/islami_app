import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/quran/sura.dart';

class MostRecentlyItem extends StatelessWidget {
  Sura sura;
  MostRecentlyItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      height: double.infinity,
      width: screenSize.width * .68,
      padding: EdgeInsets.only(left: 10, right: 8),
      decoration: BoxDecoration(
        color: AppTheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                sura.englishName,
                style: textTheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                sura.arabicName,
                style: textTheme.headlineSmall!.copyWith(color: AppTheme.black),
              ),
              Text(
                '${sura.ayatCount} Verses',
                style: textTheme.titleSmall!.copyWith(color: AppTheme.black),
              ),
            ],
          ),
          Image.asset(
            'assets/images/recent_sura.png',
            height: screenSize.height * .15,
            width: screenSize.width * .31,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
