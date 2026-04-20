import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static const String _font = 'Roboto';

  static TextStyle get headlineLarge => const TextStyle(
    fontFamily: _font,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );

  static TextStyle get headlineMedium => const TextStyle(
    fontFamily: _font,
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get bodyLarge => const TextStyle(
    fontFamily: _font,
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle get bodyMedium => const TextStyle(
    fontFamily: _font,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle get bodySmall => const TextStyle(
    fontFamily: _font,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColor.textSecondary,
  );

  static TextStyle get labelMedium => const TextStyle(
    fontFamily: _font,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColor.textPrimary,
  );

  static TextStyle get price => const TextStyle(
    fontFamily: _font,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColor.priceColor,
  );

  static TextStyle get navItem => const TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.unselectedNavText,
  );

  static TextStyle get navItemSelected => const TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.selectedNavText,
  );

  static TextStyle get caption => const TextStyle(
    fontFamily: _font,
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColor.textSecondary,
  );

  static TextStyle get buttonLabel => const TextStyle(
    fontFamily: _font,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.surface,
  );
}
