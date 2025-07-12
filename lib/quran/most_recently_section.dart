import 'package:flutter/material.dart';
import 'package:islami/quran/most_recently_item.dart';
import 'package:islami/quran/sura.dart';

import 'quran_service .dart';

class MostRecentlySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Sura sura;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20, left: 20),
          child: Text(
            'Most recently',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .16,
          child: ListView.separated(
            padding: EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) => MostRecentlyItem(
              sura: QuranService.mostRecentlySuras.reversed.toList()[index],
            ),
            separatorBuilder: (_, __) => SizedBox(width: 10),
            itemCount: QuranService.mostRecentlySuras.length,
          ),
        ),
      ],
    );
  }
}
