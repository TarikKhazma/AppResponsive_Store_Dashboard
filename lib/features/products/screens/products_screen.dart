import 'package:flutter/material.dart';
import '../../../core/constants/app_size.dart';
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
  int _selectedNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    final isWide =
        MediaQuery.of(context).size.width >= AppSize.breakpointWide;

    return Scaffold(
      backgroundColor: AppColor.background,
      resizeToAvoidBottomInset: false,

      drawer: isWide
          ? null
          : AppDrawer(
              selectedIndex: _selectedNavIndex,
              onItemSelected: (i) => setState(() => _selectedNavIndex = i),
            ),

      floatingActionButton: isWide
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),

      body: Builder(
        builder: (scaffoldCtx) => Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isWide) ...[
              SidebarWidget(
                selectedIndex: _selectedNavIndex,
                onItemSelected: (i) => setState(() => _selectedNavIndex = i),
              ),
              const VerticalDivider(width: 1),
            ],
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
