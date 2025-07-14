import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/hadeth/hadeth.dart';
import 'package:islami/hadeth/hadeth_details_screen.dart';
import 'package:islami/widget/loading_indecator.dart';

class HadethItem extends StatefulWidget {
  int index;
  HadethItem({required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  Widget build(BuildContext context) {
    if (hadeth == null) loadHadeth();
    TextTheme textTheme = Theme.of(context).textTheme;
    double screenHieght = MediaQuery.sizeOf(context).height;
    return InkWell(
      onTap: () => Navigator.of(
        context,
      ).pushNamed(HadethDetailsScreen.routeName, arguments: hadeth),
      child: Container(
        padding: EdgeInsets.only(right: 8, left: 8, top: 12),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/hadeth_card_background.png'),
          ),
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/hadeth_header_left.png',
                  height: screenHieght * .1,
                  fit: BoxFit.fill,
                ),
                if (hadeth != null)
                  Expanded(
                    child: Text(
                      hadeth!.title,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall!.copyWith(
                        color: AppTheme.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                Image.asset(
                  'assets/images/hadeth_header_right.png',
                  height: screenHieght * .1,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            Expanded(
              child: hadeth == null
                  ? LoadingIndecator()
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      separatorBuilder: (_, _) => SizedBox(height: 4),
                      itemBuilder: (_, index) => Text(
                        textAlign: TextAlign.center,
                        hadeth!.content[index],
                        style: textTheme.titleLarge!.copyWith(
                          color: AppTheme.black,
                          fontSize: 20,
                        ),
                      ),
                      itemCount: hadeth!.content.length,
                    ),
            ),
            Image.asset(
              'assets/images/hadeth_footer.png',
              height: 50,
              fit: BoxFit.fitWidth,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadHadeth() async {
    String hadethFileContent = await rootBundle.loadString(
      'assets/text/h${widget.index + 1}.txt',
    );
    List<String> hadethLines = hadethFileContent.split('\n');
    String title = hadethLines[0];
    hadethLines.removeAt(0);
    List<String> content = hadethLines;
    hadeth = Hadeth(title: title, content: content, num: widget.index + 1);
    setState(() {});
  }
}
