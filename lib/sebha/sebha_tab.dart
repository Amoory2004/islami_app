import 'package:flutter/material.dart';
import 'package:islami/sebha/sebha_item.dart';

class SebhaTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          'سَبِّحِ اسْمَ رَبِّكَ الأعلى ',
          style: textTheme.headlineSmall!.copyWith(fontSize: 36),
        ),
        SizedBox(height: screenSize.height * .033),
        Padding(
          padding: const EdgeInsets.only(left: 55.0),
          child: Image.asset(
            'assets/images/sebha_header.png',
            height: screenSize.height * .1,
            width: screenSize.width * .2,
          ),
        ),
        SebhaItem(),
      ],
    );
  }
}
