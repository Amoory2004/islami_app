import 'package:flutter/material.dart';

class SebhaItem extends StatefulWidget {
  @override
  State<SebhaItem> createState() => _SebhaItemState();
}

int count = 1;
final List<String> names = ['سبحان الله', ' الحمد لله', ' الله أكبر'];

String get CurrentTasbeha {
  int index = count ~/ 33 % names.length;
  return names[index];
}

class _SebhaItemState extends State<SebhaItem> {
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    Size screenSize = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: AnimatedRotation(
            turns: angle / 360,
            duration: Duration(milliseconds: 250),
            child: InkWell(
              onTap: () {
                setState(() {
                  count++;
                  angle += 12;
                });
              },
              child: Image.asset('assets/images/sebha.png'),
            ),
          ),
        ),
        Positioned(
          top: 115,
          left: 0,
          bottom: 0,
          right: 0,
          child: Center(
            child: Column(
              children: [
                Text(
                  CurrentTasbeha,
                  style: textTheme.headlineSmall!.copyWith(fontSize: 36),
                ),
                SizedBox(height: screenSize.height * .025),
                Text(
                  count.toString(),
                  style: textTheme.headlineSmall!.copyWith(fontSize: 36),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
