import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/quran/quran_service%20.dart';
import 'package:islami/quran/sura.dart';
import 'package:islami/widget/loading_indecator.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = '/sura-details';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayat = [];

  late Sura sura;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    sura = ModalRoute.of(context)!.settings.arguments as Sura;
    if (ayat.isEmpty) {
      loadSura();
    }
    double screenHieght = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text(sura.englishName)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/details_sura_left.png',
                  height: screenHieght * .1,
                  fit: BoxFit.fill,
                ),
                Text(
                  sura.arabicName,
                  style: TextTheme.of(
                    context,
                  ).headlineSmall!.copyWith(color: AppTheme.primary),
                ),
                Image.asset(
                  'assets/images/details_sura_right.png',
                  height: screenHieght * .1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          Expanded(
            child: ayat.isEmpty
                ? Center(child: LoadingIndecator())
                : ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    itemBuilder: (_, index) => Text(
                      ayat[index],
                      style: textTheme.titleLarge!.copyWith(
                        color: AppTheme.primary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    separatorBuilder: (_, _) => SizedBox(height: 10),
                    itemCount: ayat.length,
                  ),
          ),
          Image.asset(
            'assets/images/details_footer.png',
            height: screenHieght * .1,
            fit: BoxFit.fill,
            width: double.infinity,
          ),
        ],
      ),
    );
  }

  Future<void> loadSura() async {
    String suraFile = await QuranService.loadSuraFile(sura.num);
    ayat = suraFile.split('\n');
    setState(() {});
  }
}
