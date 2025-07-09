import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/quran/quran_service%20.dart';
import 'package:islami/quran/sura.dart';
import 'package:islami/quran/sura_details.dart';
import 'package:islami/quran/sura_item.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            style: textTheme.titleMedium,
            decoration: InputDecoration(
              hintText: 'Sura Name',
              prefixIcon: SvgPicture.asset(
                'assets/icons/quran.svg',
                colorFilter: ColorFilter.mode(
                  AppTheme.primary,
                  BlendMode.srcIn,
                ),
                height: 28,
                width: 28,
                fit: BoxFit.scaleDown,
              ),
            ),
            onChanged: (query) {
              setState(() {
                QuranService.searchSura(query);
              });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text('Sura List', style: textTheme.titleMedium),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            itemBuilder: (_, index) {
              Sura sura = QuranService.suras[index];
              return InkWell(
                child: SuraItem(sura: QuranService.suras[index]),
                onTap: () => Navigator.of(
                  context,
                ).pushNamed(SuraDetails.routeName, arguments: sura),
              );
            },
            itemCount: QuranService.suras.length,
            separatorBuilder: (_, _) =>
                Divider(indent: screenWidth * .1, endIndent: screenWidth * .1),
          ),
        ),
      ],
    );
  }
}
