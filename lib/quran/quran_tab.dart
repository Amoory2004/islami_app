import 'package:flutter/material.dart';
import 'package:islami/quran/quran_service%20.dart';
import 'package:islami/quran/sura_item.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            'Sura List',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) =>
                SuraItem(sura: QuranService.suras[index]),
            itemCount: QuranService.suras.length,
            separatorBuilder: (_, _) =>
                Divider(indent: screenWidth * .1, endIndent: screenWidth * .1),
          ),
        ),
      ],
    );
  }
}
