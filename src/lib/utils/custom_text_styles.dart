import '../utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

/* uygulama içindeki bütün yazı tiplerini ve fontları taşıyan sayfa */

class CustomTextStyles {
  // Body text style
  static get bodyLargeTillanaBlack900 =>
      theme.textTheme.bodyLarge!.tillana.copyWith(
          color: appTheme.black900,
          fontSize: 18.fSize,
          fontStyle: FontStyle.italic);

  static get bodyMedium14 =>
      theme.textTheme.bodyMedium!.copyWith(fontSize: 14.fSize);
  static get bodyMedium14White => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 14.fSize,
        color: Colors.white,
      );
  static get bodyMedium15 => theme.textTheme.bodyMedium!.copyWith(
        fontSize: 15.fSize,
      );
  static get bodyMedium15Italic => theme.textTheme.bodyMedium!
      .copyWith(fontSize: 15.fSize, fontStyle: FontStyle.italic);
        static get bodyMedium16Italic => theme.textTheme.bodyMedium!
      .copyWith(fontSize: 16.fSize, fontStyle: FontStyle.italic);
  static get bodyMediumTimmana =>
      theme.textTheme.bodyMedium!.timmana.copyWith(fontSize: 18.fSize);

  // Display text style
  static get displaySmallBlack900 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.black900,
      );
  static get displaySmallRed800 => theme.textTheme.displaySmall!.copyWith(
        color: appTheme.red800,
      );
  // Headline text style
  static get headlineLargeBlack900 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900,
      );
  static get headlineLargeBlack900_1 => theme.textTheme.headlineLarge!.copyWith(
        color: appTheme.black900.withOpacity(0.5),
      );
    static get headlineLargeTimmana => theme.textTheme.headlineLarge!.timmana
      .copyWith(fontSize: 28.fSize);
  static get headlineLargeTimmanaItalic => theme.textTheme.headlineLarge!.timmana
      .copyWith(fontSize: 28.fSize, fontStyle: FontStyle.italic);
    static get headlineLargeTimmanaBlackItalic => theme.textTheme.headlineLarge!.timmana
      .copyWith(fontSize: 28.fSize, fontStyle: FontStyle.italic, color: Colors.black);
      static get headlineLargeTimmanaBlackItalicHint => theme.textTheme.headlineLarge!.timmana
      .copyWith(fontSize: 28.fSize, fontStyle: FontStyle.italic, color: Colors.black.withOpacity(0.4));
  static get headlineSmallBlack900 => theme.textTheme.headlineSmall!.copyWith(
        color: appTheme.black900.withOpacity(0.3),
      );
  static get headlineSmallWhiteA700 => theme.textTheme.headlineSmall!
      .copyWith(color: appTheme.whiteA700, fontStyle: FontStyle.italic);
  // Title style
  static get titleLargeInter => theme.textTheme.titleLarge!.inter;
}

extension on TextStyle {
  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get timmana {
    return copyWith(
      fontFamily: 'Timmana',
    );
  }

  TextStyle get tillana {
    return copyWith(
      fontFamily: 'Tillana',
    );
  }
}
