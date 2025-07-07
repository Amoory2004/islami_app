import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarUnselectedIcon extends StatelessWidget {
  String iconName;

  NavBarUnselectedIcon({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$iconName.svg',
      height: 28,
      width: 28,
      fit: BoxFit.fill,
    );
  }
}
