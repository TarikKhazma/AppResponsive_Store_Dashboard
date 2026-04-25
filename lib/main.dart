import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/constants/app_string.dart';
import 'core/database/database_helper.dart';
import 'core/theme/app_theme.dart';
import 'features/products/cubit/products_cubit.dart';
import 'features/products/data/repository/product_repository.dart';
import 'features/products/screens/products_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final repo = ProductRepository(db: DatabaseHelper.instance, prefs: prefs);

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (_) => BlocProvider(
        create: (_) => ProductsCubit(repo)..loadProducts(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.appName,
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const ProductsScreen(),
    );
  }
}
