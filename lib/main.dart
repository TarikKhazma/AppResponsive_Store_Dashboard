import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'core/constants/app_string.dart';
import 'core/theme/app_theme.dart';
import 'features/products/screens/products_screen.dart';

void main() {
  runApp(DevicePreview(enabled: !kReleaseMode, builder: (_) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // إعدادات device_preview
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const ProductsScreen(),
    );
  }
}
