class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'name': name,
      'category': category,
      'price': price,
      'imageUrl': imageUrl,
    };
    final dbId = int.tryParse(id);
    if (dbId != null) map['id'] = dbId;
    return map;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: (map['id'] as int?)?.toString() ?? '',
        name: map['name'] as String,
        category: map['category'] as String,
        price: (map['price'] as num).toDouble(),
        imageUrl: map['imageUrl'] as String,
      );

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    String? imageUrl,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
      );
}
