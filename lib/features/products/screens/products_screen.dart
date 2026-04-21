import 'package:flutter/material.dart';
import '../../../core/theme/app_color.dart';
import '../widgets/content_area_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/sidebar_widget.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  int _selectedNavIndex = 2; // Products هون حددات شو اول زر نحدد عليه اول ما يشتغل البرنامج

  // الشاشة تُعتبر واسعة عند 600px فأكثر
  static const double _kBreakpoint = 600;

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width >= _kBreakpoint;

    return Scaffold(
      backgroundColor: AppColor.background,
      resizeToAvoidBottomInset: false,

      // Drawer (موبايل فقط) 
      drawer: isWide
          ? null
          : AppDrawer(
              selectedIndex: _selectedNavIndex,
              onItemSelected: (i) => setState(() => _selectedNavIndex = i),
            ),

      //  (موبايل فقط) — يحل محل زر "Add New Product" 
      floatingActionButton: isWide
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),

      // Body
      
      body: Builder(
        builder: (scaffoldCtx) => Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Sidebar ثابت على الشاشات الواسعة
            if (isWide) ...[
              SidebarWidget(
                selectedIndex: _selectedNavIndex,
                onItemSelected: (i) => setState(() => _selectedNavIndex = i),
              ),
              const VerticalDivider(width: 1),
            ],
            // المحتوى الرئيسي 
            Expanded(
              child: ContentAreaWidget(
                isWide: isWide,
                onMenuTap: () => Scaffold.of(scaffoldCtx).openDrawer(),
                onAddProduct: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
