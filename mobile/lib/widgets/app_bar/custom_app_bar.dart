import 'package:flutter/material.dart';
import '../../core/app_export.dart';

enum Style { bgFillGray5001 }

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar(
      {Key? key,
      this.height,
      this.shape,
      this.styleType,
      this.leadingWidth,
      this.leading,
      this.title,
      this.centerTitle,
      this.actions})
      : super(
          key: key,
        );

  final double? height;

  final ShapeBorder? shape;

  final Style? styleType;

  final double? leadingWidth;

  final Widget? leading;

  final Widget? title;

  final bool? centerTitle;

  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      shape: shape,
      toolbarHeight: height ?? 56.h,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      flexibleSpace: _getStyle(),
      leadingWidth: leadingWidth ?? 0,
      leading: leading,
      title: title,
      titleSpacing: 0,
      centerTitle: centerTitle ?? false,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size(
        SizeUtils.width,
        height ?? 56.h,
      );
  _getStyle() {
    switch (styleType) {
      case Style.bgFillGray5001:
        return Container(
          height: 126.h,
          width: 374.h,
          decoration: BoxDecoration(
            color: appTheme.gray5001,
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24.h),
            ),
          ),
        );
      default:
        return null;
    }
  }
}
