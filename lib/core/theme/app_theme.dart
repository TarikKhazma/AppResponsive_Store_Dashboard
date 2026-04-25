import 'package:flutter/material.dart';
import '../constants/app_size.dart';
import 'app_color.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
          surface: AppColor.surface,
        ),
        scaffoldBackgroundColor: AppColor.background,
        drawerTheme: const DrawerThemeData(
          backgroundColor: AppColor.surface,
          surfaceTintColor: Colors.transparent,
        ),
        dividerTheme: const DividerThemeData(
          color: AppColor.divider,
          thickness: 1,
          space: 1,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.surface,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.radiusM),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.s20,
              vertical: AppSize.s12,
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.surface,
          elevation: 4,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: AppColor.surface,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSize.s16,
            vertical: AppSize.s12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.radiusM),
            borderSide: const BorderSide(color: AppColor.cardBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.radiusM),
            borderSide: const BorderSide(color: AppColor.cardBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.radiusM),
            borderSide: const BorderSide(color: AppColor.primary, width: 1.5),
          ),
        ),
      );
}
