import 'package:flutter/material.dart';
import 'package:islami/quran/sura.dart';

class SuraItem extends StatelessWidget {
  Sura sura;

  SuraItem({required this.sura});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 52,
          height: 52,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/sura_number_frame.png'),
            ),
          ),
          child: Text(
            '${sura.num}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(width: 15),
        Column(
          children: [
            Text(
              sura.englishName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              '${sura.ayatCount} verses',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
        Spacer(),
        Text(sura.arabicName, style: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
