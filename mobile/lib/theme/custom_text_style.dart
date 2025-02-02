import 'package:flutter/material.dart';
import '../core/app_export.dart';

extension on TextStyle {
  TextStyle get tajawal {
    return copyWith(
      fontFamily: 'Tajawal',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }

  TextStyle get cairo {
    return copyWith(
      fontFamily: 'Cairo',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style
  static TextStyle get bodyMediumBluegray30001 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray30001,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodyMediumBluegray30001_1 =>
      theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.blueGray30001,
      );
  static TextStyle get bodyMediumRed400 => theme.textTheme.bodyMedium!.copyWith(
        color: appTheme.red400,
      );
  static TextStyle get bodyMediumTajawalGray50006 =>
      theme.textTheme.bodyMedium!.tajawal.copyWith(
        color: appTheme.gray50006,
      );
  static TextStyle get bodySmallBlack900 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.black900,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallCairoBluegray200 =>
      theme.textTheme.bodySmall!.cairo.copyWith(
        color: appTheme.blueGray200,
        fontSize: 10.fSize,
      );
  static TextStyle get bodySmallCairoGray90012 =>
      theme.textTheme.bodySmall!.cairo.copyWith(
        color: appTheme.gray90012,
      );
  static TextStyle get bodySmallGray600 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallGray60011 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
        fontSize: 11.fSize,
      );
  static TextStyle get bodySmallGray600_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static TextStyle get bodySmallGray600_2 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray600,
      );
  static TextStyle get bodySmallGray90005 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90005,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallGray9000511 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90005,
        fontSize: 11.fSize,
      );
  static TextStyle get bodySmallGray90005_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.gray90005,
      );
  static TextStyle get bodySmallOnPrimary =>
      theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 11.fSize,
        fontWeight: FontWeight.w300,
      );
  static TextStyle get bodySmallPrimary => theme.textTheme.bodySmall!.copyWith(
        color: theme.colorScheme.primary,
      );
  static TextStyle get bodySmallTeal400 => theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal400,
        fontSize: 10.fSize,
      );
  static TextStyle get bodySmallTeal400_1 =>
      theme.textTheme.bodySmall!.copyWith(
        color: appTheme.teal400,
      );
// Headline text style
  static TextStyle get headlineSmallBluegray90003 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.blueGray90003,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headlineSmallCairo =>
      theme.textTheme.headlineSmall!.cairo.copyWith(
        fontWeight: FontWeight.w600,
      );
  static TextStyle get headlineSmallCairoPrimary =>
      theme.textTheme.headlineSmall!.cairo.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get headlineSmallGray90006 =>
      theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.gray90006,
      );
// Label text style
  static TextStyle get labelLargeBluegray800 =>
      theme.textTheme.labelLarge!.copyWith(
        color: appTheme.blueGray800,
      );
  static TextStyle get labelLargeBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeCairoGray90012 =>
      theme.textTheme.labelLarge!.cairo.copyWith(
        color: appTheme.gray90012,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeCairoPrimary =>
      theme.textTheme.labelLarge!.cairo.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get labelLargeOnPrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get labelLargePrimary =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get labelLargePrimary_1 =>
      theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.primary,
      );
// Poppins text style
  static TextStyle get poppinsBluegray30001 => TextStyle(
        color: appTheme.blueGray30001,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w400,
      ).poppins;
  static TextStyle get poppinsBluegray30001Medium => TextStyle(
        color: appTheme.blueGray30001,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static TextStyle get poppinsGray600 => TextStyle(
        color: appTheme.gray600,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static TextStyle get poppinsPrimary => TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w500,
      ).poppins;
  static TextStyle get poppinsPrimaryBold => TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 7.fSize,
        fontWeight: FontWeight.w700,
      ).poppins;
  static TextStyle get poppinsPrimaryRegular => TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 6.fSize,
        fontWeight: FontWeight.w400,
      ).poppins;
// Title text style
  static TextStyle get titleLargePoppinsBluegray30001 =>
      theme.textTheme.titleLarge!.poppins.copyWith(
        color: appTheme.blueGray30001,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get titleMediumBluegray200 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray200,
        fontSize: 16.fSize,
      );
  static TextStyle get titleMediumBluegray200Medium =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumGray90013 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90013,
        fontSize: 16.fSize,
      );
  static TextStyle get titleMediumGray9001316 =>
      theme.textTheme.titleMedium!.copyWith(
        color: appTheme.gray90013,
        fontSize: 16.fSize,
      );
  static TextStyle get titleMediumOnPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontSize: 16.fSize,
      );
  static TextStyle get titleMediumPoppinsBlack900 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.black900,
      );
  static TextStyle get titleMediumPoppinsBluegray200 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumPoppinsBluegray90003 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.blueGray90003,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumPoppinsGray90005 =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: appTheme.gray90005,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumPoppinsPrimary =>
      theme.textTheme.titleMedium!.poppins.copyWith(
        color: theme.colorScheme.primary,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get titleMediumPrimary =>
      theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.primary,
        fontSize: 16.fSize,
      );
  static TextStyle get titleSmallBluegray700 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray700,
      );
  static TextStyle get titleSmallBluegray90003 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.blueGray90003,
      );
  static TextStyle get titleSmallCairoBluegray200 =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: appTheme.blueGray200,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallCairoBluegray200_1 =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: appTheme.blueGray200,
      );
  static TextStyle get titleSmallCairoBluegray30001 =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: appTheme.blueGray30001,
      );
  static TextStyle get titleSmallCairoBluegray600 =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: appTheme.blueGray600,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallCairoErrorContainer =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: theme.colorScheme.errorContainer,
      );
  static TextStyle get titleSmallCairoGray40003 =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: appTheme.gray40003,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallCairoOnPrimary =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallCairoPrimary =>
      theme.textTheme.titleSmall!.cairo.copyWith(
        color: theme.colorScheme.primary,
      );
  static TextStyle get titleSmallGray600 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray600,
      );
  static TextStyle get titleSmallGray80002 =>
      theme.textTheme.titleSmall!.copyWith(
        color: appTheme.gray80002,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get titleSmallOnPrimary =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get titleSmallOnPrimary_1 =>
      theme.textTheme.titleSmall!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static TextStyle get titleSmallSemiBold =>
      theme.textTheme.titleSmall!.copyWith(
        fontWeight: FontWeight.w600,
      );
}
