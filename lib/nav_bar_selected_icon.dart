import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islami/app_theme.dart';

class NavBarSelectedIcon extends StatelessWidget {
  String iconName;

  NavBarSelectedIcon({required this.iconName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: AppTheme.black.withValues(alpha: .6),
        borderRadius: BorderRadius.circular(66),
      ),
      child: SvgPicture.asset(
        'assets/icons/$iconName.svg',
        height: 22,
        width: 22,
        fit: BoxFit.fill,
        colorFilter: ColorFilter.mode(AppTheme.white, BlendMode.srcIn),
      ),
    );
  }
}
