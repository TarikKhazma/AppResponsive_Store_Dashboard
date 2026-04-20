import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../data/products_data.dart';
import '../models/product_model.dart';
import 'header_widget.dart';
import 'pagination_widget.dart';
import 'product_card.dart';
import 'search_bar_widget.dart';

class ContentAreaWidget extends StatefulWidget {
  final bool isWide;
  // هون منقدر نكتب Function() or VoidCallback
  final Function()? onMenuTap;
  final VoidCallback? onAddProduct;

  const ContentAreaWidget({
    super.key,
    required this.isWide,
    this.onMenuTap,
    this.onAddProduct,
  });

  @override
  State<ContentAreaWidget> createState() => _ContentAreaWidgetState();
}

class _ContentAreaWidgetState extends State<ContentAreaWidget> {
  int _currentPage = 1;
  String _searchQuery = '';

  List<ProductModel> get _filtered => mockProducts
      .where(
        (p) =>
            p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            p.category.toLowerCase().contains(_searchQuery.toLowerCase()),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = widget.isWide ? 4 : 2;
    final products = _filtered;

    return CustomScrollView(
      slivers: [
        // ----------Header-----------
        SliverToBoxAdapter(
          child: HeaderWidget(
            isWide: widget.isWide,
            onMenuTap: widget.onMenuTap,
            onAddProduct: widget.onAddProduct,
          ),
        ),

        // ----------Search----------
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
            child: SearchBarWidget(
              onChanged: (q) => setState(() => _searchQuery = q),
            ),
          ),
        ),

        // ---------Grid-----------
        products.isEmpty
            ? SliverFillRemaining(
                child: Center(
                  child: Text(
                    'No products found',
                    style: AppTextStyle.bodyLarge.copyWith(
                      color: AppColor.unselectedNavText,
                    ),
                  ),
                ),
              )
            : SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                sliver: SliverMasonryGrid.count(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (_, i) =>
                      Center(child: ProductCard(product: products[i])),
                  childCount: products.length,
                ),
              ),

        // Pagination
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: PaginationWidget(
              currentPage: _currentPage,
              totalPages: 12,
              onPageChanged: (p) => setState(() => _currentPage = p),
            ),
          ),
        ),
      ],
    );
  }
}
