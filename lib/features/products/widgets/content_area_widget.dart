import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../core/theme/app_color.dart';
import '../../../core/theme/app_text_style.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import 'header_widget.dart';
import 'pagination_widget.dart';
import 'product_card.dart';
import 'search_bar_widget.dart';

class ContentAreaWidget extends StatefulWidget {
  final bool isWide;
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
  late final TextEditingController _searchController;
  bool _controllerInitialized = false;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final crossAxisCount = widget.isWide ? 4 : 2;

    return BlocConsumer<ProductsCubit, ProductsState>(
      listenWhen: (prev, curr) =>
          prev.status != curr.status && curr.status == ProductStatus.loaded,
      listener: (context, state) {
        // استرجاع آخر بحث محفوظ عند أول تحميل
        if (!_controllerInitialized && state.searchQuery.isNotEmpty) {
          _searchController.text = state.searchQuery;
          _controllerInitialized = true;
        }
      },
      builder: (context, state) {
        final products = state.filteredProducts;

        return CustomScrollView(
          slivers: [
            // ---------- Header ----------
            SliverToBoxAdapter(
              child: HeaderWidget(
                isWide: widget.isWide,
                onMenuTap: widget.onMenuTap,
                onAddProduct: widget.onAddProduct,
              ),
            ),

            // ---------- Search ----------
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: SearchBarWidget(
                  controller: _searchController,
                  onChanged: (q) => context.read<ProductsCubit>().search(q),
                ),
              ),
            ),

            // ---------- Loading ----------
            if (state.status == ProductStatus.loading)
              const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              )

            // ---------- Grid ----------
            else if (products.isEmpty)
              SliverFillRemaining(
                child: Center(
                  child: Text(
                    'No products found',
                    style: AppTextStyle.bodyLarge.copyWith(
                      color: AppColor.unselectedNavText,
                    ),
                  ),
                ),
              )
            else
              SliverPadding(
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

            // ---------- Pagination ----------
            if (state.status == ProductStatus.loaded)
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
      },
    );
  }
}
