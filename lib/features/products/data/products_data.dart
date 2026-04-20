import '../../../core/constants/app_images.dart';
import '../models/product_model.dart';

const List<ProductModel> mockProducts = [
  ProductModel(
    id: '1',
    name: 'Sony WH-1000XM5',
    category: 'Electronics',
    price: 348.00,
    imageUrl: JpgImages.sonywh1000xm5,
  ),
  ProductModel(
    id: '2',
    name: 'Apple Watch Series 9',
    category: 'Wearables',
    price: 399.00,
    imageUrl: JpgImages.applewatchseries9,
  ),
  ProductModel(
    id: '3',
    name: 'Nike Air Zoom',
    category: 'Footwear',
    price: 120.00,
    imageUrl: JpgImages.nikeairzoom,
  ),
  ProductModel(
    id: '4',
    name: 'Leather Satchel',
    category: 'Accessories',
    price: 150.00,
    imageUrl: JpgImages.leathersatchel,
  ),
  ProductModel(
    id: '5',
    name: 'Ray-Ban Aviator',
    category: 'Accessories',
    price: 150.00,
    imageUrl: JpgImages.raybanaviator,
  ),
  ProductModel(
    id: '6',
    name: 'Keychron K2',
    category: 'Electronics',
    price: 89.00,
    imageUrl: PngImages.keychronk2,
  ),
  ProductModel(
    id: '7',
    name: 'Minimalist Mug',
    category: 'Home',
    price: 15.00,
    imageUrl: JpgImages.minimalistmug,
  ),
  ProductModel(
    id: '8',
    name: 'LED Desk Lamp',
    category: 'Home',
    price: 45.00,
    imageUrl: JpgImages.leddesklamp,
  ),
];
