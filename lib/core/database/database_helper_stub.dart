import '../../features/products/data/products_data.dart';
import '../../features/products/models/product_model.dart';

// Web implementation — in-memory, seeded from mockProducts
class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  DatabaseHelper._();

  final List<ProductModel> _items = List.of(mockProducts);

  Future<List<ProductModel>> getAllItems() async => List.unmodifiable(_items);

  Future<int> insertItem(ProductModel item) async {
    final newId = _items.isEmpty ? 1 : (int.tryParse(_items.last.id) ?? 0) + 1;
    _items.add(item.copyWith(id: newId.toString()));
    return newId;
  }

  Future<int> updateItem(ProductModel item) async {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) _items[index] = item;
    return index != -1 ? 1 : 0;
  }

  Future<int> deleteItem(String id) async {
    final before = _items.length;
    _items.removeWhere((i) => i.id == id);
    return _items.length < before ? 1 : 0;
  }
}
