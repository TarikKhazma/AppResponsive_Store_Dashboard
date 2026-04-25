import '../models/product_model.dart';

enum ProductStatus { initial, loading, loaded, error }

class ProductsState {
  final ProductStatus status;
  final List<ProductModel> products;
  final String searchQuery;
  final String? error;

  const ProductsState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.searchQuery = '',
    this.error,
  });

  List<ProductModel> get filteredProducts {
    if (searchQuery.isEmpty) return products;
    final q = searchQuery.toLowerCase();
    return products
        .where(
          (p) =>
              p.name.toLowerCase().contains(q) ||
              p.category.toLowerCase().contains(q),
        )
        .toList();
  }

  ProductsState copyWith({
    ProductStatus? status,
    List<ProductModel>? products,
    String? searchQuery,
    String? error,
  }) =>
      ProductsState(
        status: status ?? this.status,
        products: products ?? this.products,
        searchQuery: searchQuery ?? this.searchQuery,
        error: error,
      );
}
