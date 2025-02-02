import 'package:flutter/material.dart';
import '../../core/app_export.dart';

class AppbarSubtitleFour extends StatelessWidget {
  AppbarSubtitleFour({Key? key, required this.text, this.onTap, this.margin})
      : super(
          key: key,
        );

  final String text;

  final Function? onTap;

  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Text(
          text,
          style: CustomTextStyles.bodyMediumTajawalGray50006.copyWith(
            color: appTheme.gray50006,
          ),
        ),
      ),
    );
  }
}
