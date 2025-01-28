import 'package:home/src/model/product_size_type.dart';

import '../../core/app_data.dart';

enum ProductType {
  all, watch, mobile, headphone, tablet, tv,
  house, apartment, villa, land, office, commercial
}

class Product {
  String name;
  int price;
  int? off;
  String about;
  bool isAvailable;
  ProductSizeType? sizes;
  int _quantity;
  List<String> images;
  bool isFavorite;
  double rating;
  ProductType type;

  // ✅ Qo‘shimcha real estate tafsilotlari
  double size; // Uy hajmi (m²)
  int rooms; // Xonalar soni
  int bedrooms; // Yotoqxonalar soni
  int bathrooms; // Hammomlar soni
  bool hasGarden; // Bog‘ mavjudligi
  String location; // Joylashuv
  String additionalDetails; // Qo‘shimcha ma’lumotlar

  int get quantity => _quantity;

  set quantity(int newQuantity) {
    if (newQuantity >= 0) _quantity = newQuantity;
  }

  Product({
    this.sizes,
    this.about = AppData.dummyText,
    required this.name,
    required this.price,
    required this.isAvailable,
    required this.off,
    required int quantity,
    required this.images,
    required this.isFavorite,
    required this.rating,
    required this.type,
    required this.size, // ✅
    required this.rooms, // ✅
    required this.bedrooms, // ✅
    required this.bathrooms, // ✅
    required this.hasGarden, // ✅
    required this.location, // ✅
    required this.additionalDetails, // ✅
  }) : _quantity = quantity;
}
