import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repository/product_repository.dart';
import 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository _repository;

  ProductsCubit(this._repository) : super(const ProductsState());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: ProductStatus.loading));
    try {
      final products = await _repository.getProducts();
      final savedQuery = _repository.getSavedSearchQuery();
      emit(state.copyWith(
        status: ProductStatus.loaded,
        products: products,
        searchQuery: savedQuery,
      ));
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.error, error: e.toString()));
    }
  }

  Future<void> search(String query) async {
    await _repository.saveSearchQuery(query);
    emit(state.copyWith(status: ProductStatus.loaded, searchQuery: query));
  }
}
