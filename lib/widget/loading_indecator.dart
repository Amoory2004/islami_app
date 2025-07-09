import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';

class LoadingIndecator extends StatelessWidget {
  final Color? color;
  LoadingIndecator({this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color ?? AppTheme.primary,
      ),
    );
  }
}