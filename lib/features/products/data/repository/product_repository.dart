import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/database/database_helper.dart';
import '../../models/product_model.dart';

class ProductRepository {
  final DatabaseHelper _db;
  final SharedPreferences _prefs;

  static const _searchKey = 'last_search_query';

  ProductRepository({required DatabaseHelper db, required SharedPreferences prefs})
      : _db = db,
        _prefs = prefs;

  Future<List<ProductModel>> getProducts() => _db.getAllItems();

  Future<void> addProduct(ProductModel item) => _db.insertItem(item);
  Future<void> updateProduct(ProductModel item) => _db.updateItem(item);
  Future<void> deleteProduct(String id) => _db.deleteItem(id);

  Future<void> saveSearchQuery(String query) => _prefs.setString(_searchKey, query);
  String getSavedSearchQuery() => _prefs.getString(_searchKey) ?? '';
}
