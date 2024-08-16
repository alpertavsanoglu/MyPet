import 'app_export.dart';

/* uygulamadaki temaların depolandığı dosya */

String _appTheme = "primary";

class ThemeHelper {
  final Map<String, PrimaryColors> _supportedCustomColor = {
    'primary': PrimaryColors()
  };
  final Map<String, ColorScheme> _supportedColorScheme = {
    'primary': ColorSchemes.primaryColorScheme
  };

  PrimaryColors _getThemeColors() {
    if (!_supportedCustomColor.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }

    return _supportedCustomColor[_appTheme] ?? PrimaryColors();
  }

  ThemeData _getThemeData() {
    if (!_supportedColorScheme.containsKey(_appTheme)) {
      throw Exception(
          "$_appTheme is not found.Make sure you have added this theme class in JSON Try running flutter pub run build_runner");
    }

    var colorScheme =
        _supportedColorScheme[_appTheme] ?? ColorSchemes.primaryColorScheme;
    return ThemeData(
      visualDensity: VisualDensity.standard,
      colorScheme: colorScheme,
      textTheme: TextThemes.textTheme(colorScheme),
      scaffoldBackgroundColor: appTheme.blueGray200,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: appTheme.blueGray100,
          visualDensity: const VisualDensity(
            vertical: -4,
            horizontal: -4,
          ),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }

  PrimaryColors themeColor() => _getThemeColors();

  ThemeData themeData() => _getThemeData();
}

class TextThemes {
  static TextTheme textTheme(ColorScheme colorScheme) => TextTheme(
        bodyLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 16.fSize,
          fontFamily: 'Timmana',
          fontWeight: FontWeight.w400,
        ),
        bodyMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 13.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
        displayLarge: TextStyle(
          color: appTheme.lime90001,
          fontSize: 64.fSize,
          fontFamily: 'Figma Hand',
          fontWeight: FontWeight.w400,
        ),
        displayMedium: TextStyle(
          color: appTheme.black900,
          fontSize: 40.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
        displaySmall: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 36.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
        headlineLarge: TextStyle(
          color: appTheme.whiteA700,
          fontSize: 32.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
        headlineSmall: TextStyle(
          color: appTheme.black900,
          fontSize: 24.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
        titleLarge: TextStyle(
          color: appTheme.black900,
          fontSize: 20.fSize,
          fontFamily: 'Tillana',
          fontWeight: FontWeight.w400,
        ),
      );
}

class ColorSchemes {
  static const primaryColorScheme = ColorScheme.light();
}

class PrimaryColors {
  // Black
  Color get black900 => const Color(0XFF000000);

  // BlueGray
  Color get blueGray100 => const Color(0XFFD9D9D9);
  Color get blueGray200 => const Color(0XFFB0BDC6);
  Color get borderDarkBlue => const Color(0xFF000066).withOpacity(0.7);

  // DeepOrange
  Color get deepOrange100 => const Color(0XFFFEC4A4);
  Color get deepOrange200 => const Color(0XFFFDB78F);

  // DeepOrangeCc
  Color get deepOrange100Cc => const Color(0XCCDFC7B8);

  // DeepOrangec
  Color get deepOrange2008c => const Color(0X8CFEB790);

  // DeepOrangeAAf
  Color get deepOrangeA100Af => const Color(0XAFEFA26A);

  // Gray
  Color get gray600 => const Color(0XFFAC8568);

  // GrayEf
  Color get gray800Ef => const Color(0XEF433D3D);

  // LightGreen
  Color get lightGreen5089 => const Color(0X89F6F5EC);
  Color get lightGreen508901 => const Color(0X89F5F4EC);

  // LimeB
  Color get lime800B2 => const Color(0XB2C57A30);

  // Lime
  Color get lime900 => const Color(0XFF8D4A0C);
  Color get lime90001 => const Color(0XFF8D4707);

  // Red
  Color get red300 => const Color(0XFFD3976E);
  Color get red800 => const Color(0XFFB34343);

  // White
  Color get whiteA700 => const Color(0XFFFFFFFF);

  // Yellow
  Color get yellow700 => const Color(0XFFE6B432);
}

PrimaryColors get appTheme => ThemeHelper().themeColor();
ThemeData get theme => ThemeHelper().themeData();
