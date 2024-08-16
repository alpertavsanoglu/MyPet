import '../utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

/* uygulama içinde kullanılacak decorationların tanımlandığı dosya */

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray200,
      );
  static BoxDecoration get fillBluegray100 => BoxDecoration(
        color: appTheme.blueGray100,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange100,
      );
  static BoxDecoration get fillDeepOrangeAAf => BoxDecoration(
        color: appTheme.deepOrangeA100Af,
      );
  static BoxDecoration get fillDeepOrangeC => BoxDecoration(
        color: appTheme.deepOrange2008c,
      );
  static BoxDecoration get fillDeepOrangeCc => BoxDecoration(
        color: appTheme.deepOrange100Cc,
      );
  static BoxDecoration get fillGrayEf => BoxDecoration(
        color: appTheme.gray800Ef,
      );
  static BoxDecoration get fillLimeB => BoxDecoration(
        color: appTheme.lime800B2,
      );
  static BoxDecoration get fillWhiteA => BoxDecoration(
        color: appTheme.whiteA700,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: appTheme.whiteA700,
        boxShadow: [
          BoxShadow(
            color: appTheme.black900.withOpacity(0.25),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: const Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get outlineBlack900 => BoxDecoration(
        color: appTheme.blueGray200.withOpacity(0.7),
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
        ),
      );
  static BoxDecoration get outlineBlack900Opac => BoxDecoration(
        color: appTheme.blueGray200,
        border: Border.all(
          color: appTheme.black900,
          width: 1.h,
        ),
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder30 => BorderRadius.circular(
        30.h,
      );

  // Custom borders
  static BorderRadius get customBorderTL22 => BorderRadius.only(
        topLeft: Radius.circular(22.h),
        bottomRight: Radius.circular(22.h),
      );

  // Rounded borders
  static BorderRadius get roundedBorder10 => BorderRadius.circular(
        10.h,
      );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
        20.h,
      );
  static BorderRadius get roundedBorder25 => BorderRadius.circular(
        25.h,
      );
  static BorderRadius get roundedBorder42 => BorderRadius.circular(
        42.h,
      );
  static BorderRadius get roundedBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get roundedBorder60 => BorderRadius.circular(
        60.h,
      );
  static BorderRadius get roundedBorder66 => BorderRadius.circular(
        66.h,
      );
  static BorderRadius get roundedBorder80 => BorderRadius.circular(
        80.h,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
