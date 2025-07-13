import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/hadeth/hadeth.dart';

class HadethDetailsScreen extends StatelessWidget {
  static const routeName = '/hadeth-details';
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;

    double screenHieght = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: AppBar(title: Text('Hadeth ${hadeth.num}')),
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
                  hadeth.title,
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
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemBuilder: (_, index) => Text(
                hadeth.content[index],
                style: textTheme.titleLarge!.copyWith(color: AppTheme.primary),
                textAlign: TextAlign.center,
              ),
              separatorBuilder: (_, _) => SizedBox(height: 10),
              itemCount: hadeth.content.length,
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
}
