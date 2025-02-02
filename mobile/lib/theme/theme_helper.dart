import 'package:flutter/material.dart';
import '../core/app_export.dart';

LightCodeColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();

/// Helper class for managing themes and colors.

// ignore_for_file: must_be_immutable
class ThemeHelper {
  // The current app theme
  var _appTheme = PrefUtils().getThemeData();

// A map of custom color themes supported by the app
  Map<String, LightCodeColors> _supportedCustomColor = {
    'lightCode': LightCodeColors()
  };

// A map of color schemes supported by the app
  Map<String, ColorScheme> _supportedColorScheme = {
    'lightCode': ColorSchemes.lightCodeColorScheme
  };

  /// Returns the lightCode colors for the current theme.
  LightCodeColors _getThemeColors() {
    return _supportedCustomColor[_appTheme] ?? LightCodeColors();
  }

  /// Returns the current theme data.
  ThemeData _getThemeData() {
    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.lightCodeColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: colorScheme.onPrimary,
          side: BorderSide(
            color: appTheme.gray20001,
            width: 1.h,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.h),
          ),
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.h),
          ),
          shadowColor: appTheme.black900.withValues(
            alpha: 0.15,
          ),
          elevation: 0,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
      dividerTheme: DividerThemeData(
        thickness: 4,
        space: 4,
        color: appTheme.blueGray200,
      ),
    );
  }

  /// Returns the lightCode colors for the current theme.
  LightCodeColors themeColor() => _getThemeColors();

  /// Returns the current theme data.
  ThemeData themeData() => _getThemeData();
}

/// Class containing the supported text theme styles.
class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: colorScheme.primary,
          fontSize: 18.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.gray90005,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        bodySmall: TextStyle(
          color: appTheme.blueGray30001,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: colorScheme.onPrimary,
          fontSize: 48.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w800,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        labelLarge: TextStyle(
          color: appTheme.blueGray30001,
          fontSize: 12.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          color: appTheme.gray90012,
          fontSize: 20.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w700,
        ),
        titleMedium: TextStyle(
          color: appTheme.gray90012,
          fontSize: 18.fSize,
          fontFamily: 'Cairo',
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: appTheme.gray90005,
          fontSize: 14.fSize,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
        ),
      );
}

/// Class containing the supported color schemes.
class ColorSchemes {
  static final lightCodeColorScheme = ColorScheme.light(
    primary: Color(0XFFE0211C),
    primaryContainer: Color(0XFFF5F6F8),
    errorContainer: Color(0XFF534C4C),
    onError: Color(0XFF2F2F27),
    onErrorContainer: Color(0XFF121112),
    onPrimary: Color(0XFFFFFFFF),
    onPrimaryContainer: Color(0XFF6B1C10),
  );
}

/// Class containing custom colors for a lightCode theme.
class LightCodeColors {
  // Amber
  Color get amber300 => Color(0XFFFFC656);
  Color get amber30001 => Color(0XFFFFCF5B);
  Color get amber500 => Color(0XFFFFC107);
// Black
  Color get black900 => Color(0XFF000000);
// Blue
  Color get blue700 => Color(0XFF1976D2);
  Color get blueA200 => Color(0XFF3B82F6);
// BlueGray
  Color get blueGray100 => Color(0XFFD1D5DB);
  Color get blueGray10001 => Color(0XFFD1D1D1);
  Color get blueGray200 => Color(0XFFA9B0B2);
  Color get blueGray300 => Color(0XFF8A9E9C);
  Color get blueGray30001 => Color(0XFF9CA3AF);
  Color get blueGray3001e => Color(0X1E94A3B8);
  Color get blueGray400 => Color(0XFF8D8B89);
  Color get blueGray40001 => Color(0XFF77939D);
  Color get blueGray40002 => Color(0XFF799E9E);
  Color get blueGray50 => Color(0XFFEEF1F7);
  Color get blueGray600 => Color(0XFF5C6A6E);
  Color get blueGray700 => Color(0XFF4B5563);
  Color get blueGray70001 => Color(0XFF2D606C);
  Color get blueGray800 => Color(0XFF374151);
  Color get blueGray900 => Color(0XFF212D38);
  Color get blueGray90001 => Color(0XFF272F35);
  Color get blueGray90002 => Color(0XFF222838);
  Color get blueGray90003 => Color(0XFF1F2937);
  Color get blueGray90004 => Color(0XFF343330);
// DeepOrange
  Color get deepOrange100 => Color(0XFFF2CBBA);
  Color get deepOrange200 => Color(0XFFE7AC8A);
  Color get deepOrange20001 => Color(0XFFE1BA92);
  Color get deepOrange600 => Color(0XFFF05925);
  Color get deepOrangeA100 => Color(0XFFF7A06F);
  Color get deepOrangeA10001 => Color(0XFFCEA26E);
  Color get deepOrangeA400 => Color(0XFFFF3D00);
// Gray
  Color get gray100 => Color(0XFFF3F4F6);
  Color get gray200 => Color(0XFFF2EFE7);
  Color get gray20001 => Color(0XFFE5E7EB);
  Color get gray400 => Color(0XFFC0C0C0);
  Color get gray40001 => Color(0XFFB1B6AB);
  Color get gray40002 => Color(0XFFC5C3B9);
  Color get gray40003 => Color(0XFFBCBCBC);
  Color get gray50 => Color(0XFFF5F3FF);
  Color get gray500 => Color(0XFF969494);
  Color get gray50001 => Color(0XFF90908F);
  Color get gray50002 => Color(0XFFB5AAA0);
  Color get gray50003 => Color(0XFFADADAD);
  Color get gray50004 => Color(0XFF8E9A85);
  Color get gray50005 => Color(0XFF9AA094);
  Color get gray50006 => Color(0XFFA8A6A7);
  Color get gray5001 => Color(0XFFF9FAFB);
  Color get gray600 => Color(0XFF6B7280);
  Color get gray60001 => Color(0XFF676E70);
  Color get gray60002 => Color(0XFFA46E56);
  Color get gray60003 => Color(0XFF956C5A);
  Color get gray800 => Color(0XFF603B2E);
  Color get gray80001 => Color(0XFF3A3939);
  Color get gray80002 => Color(0XFF45433F);
  Color get gray80003 => Color(0XFF473227);
  Color get gray80004 => Color(0XFF601D18);
  Color get gray80005 => Color(0XFF3C4142);
  Color get gray80006 => Color(0XFF343F42);
  Color get gray900 => Color(0XFF231F20);
  Color get gray90001 => Color(0XFF1A1A1A);
  Color get gray90002 => Color(0XFF1D1A19);
  Color get gray90003 => Color(0XFF232526);
  Color get gray90004 => Color(0XFF171819);
  Color get gray90005 => Color(0XFF111827);
  Color get gray90006 => Color(0XFF121212);
  Color get gray90007 => Color(0XFF2A2422);
  Color get gray90008 => Color(0XFF282322);
  Color get gray90009 => Color(0XFF1A2123);
  Color get gray90010 => Color(0XFF151413);
  Color get gray90011 => Color(0XFF2D2A29);
  Color get gray90012 => Color(0XFF10242A);
  Color get gray90013 => Color(0XFF1E1E1E);
// Green
  Color get green100 => Color(0XFFCCD1C7);
  Color get green500 => Color(0XFF4CAF50);
  Color get green800 => Color(0XFF0FB500);
// Indigo
  Color get indigo60019 => Color(0X19525298);
// LightGreen
  Color get lightGreen50 => Color(0XFFF0F2E9);
// Lime
  Color get lime50 => Color(0XFFF9FEE9);
// Orange
  Color get orange100 => Color(0XFFFFE4B5);
  Color get orange200 => Color(0XFFFBC18A);
  Color get orange20001 => Color(0XFFF3C26B);
  Color get orangeA200 => Color(0XFFF1AB3F);
// Red
  Color get red200 => Color(0XFFD9B17E);
  Color get red20001 => Color(0XFFD7AF87);
  Color get red20002 => Color(0XFFDFB793);
  Color get red20003 => Color(0XFFDB9E7F);
  Color get red20004 => Color(0XFFE89D84);
  Color get red20005 => Color(0XFFE4B8A4);
  Color get red300 => Color(0XFFBA735D);
  Color get red30001 => Color(0XFFC49C69);
  Color get red30002 => Color(0XFFC6775C);
  Color get red30003 => Color(0XFFC97B63);
  Color get red30004 => Color(0XFFB9936D);
  Color get red30005 => Color(0XFFC87E5D);
  Color get red30006 => Color(0XFFE09173);
  Color get red30007 => Color(0XFFBB9268);
  Color get red30008 => Color(0XFFBF8060);
  Color get red30009 => Color(0XFFD6836E);
  Color get red400 => Color(0XFFF2485D);
  Color get red40001 => Color(0XFFE95D5D);
  Color get red800 => Color(0XFFB93626);
  Color get red900 => Color(0XFFB62825);
// Teal
  Color get teal100 => Color(0XFFAED8DA);
  Color get teal400 => Color(0XFF10B981);
// Yellow
  Color get yellow700 => Color(0XFFFBBF24);
  Color get yellow900 => Color(0XFFC87929);
}
