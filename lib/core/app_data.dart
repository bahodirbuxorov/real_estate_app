import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../src/model/bottom_nav_bar_item.dart';
import '../src/model/product.dart';
import '../src/model/product_category.dart';
import '../src/model/recommended_product.dart';

class AppData {
  const AppData._();

  static const String dummyText = 'Ko‘chmas mulk bozoridagi eng yaxshi takliflarni siz uchun tanlab oldik!';

  static List<Product> products = [
    Product(
      name: 'Hasamatiy Villa',
      price: 250000,
      isAvailable: true,
      off: 20000,
      quantity: 1,
      images: [
        'assets/images/house1.jpg',
        'assets/images/house2.jpg',
        'assets/images/house3.jpg',
      ],
      isFavorite: true,
      rating: 5,
      type: ProductType.house,
      size: 350, // Hajmi (m²)
      rooms: 6, // Xonalar soni
      bedrooms: 4, // Yotoqxonalar soni
      bathrooms: 3, // Hammomlar soni
      hasGarden: true, // Bog‘ mavjudligi
      location: "Toshkent, Yunusobod",
      additionalDetails: 'Hovli, basseyn, 2 ta garaj, zamonaviy dizayn',
    ),
    Product(
      name: 'Loyiha Tayyor Uy',
      price: 180000,
      isAvailable: true,
      off: 15000,
      quantity: 1,
      images: [
        'assets/images/house2.jpg',
        'assets/images/house3.jpg',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.house,
      size: 280, // Hajmi (m²)
      rooms: 5, // Xonalar soni
      bedrooms: 3, // Yotoqxonalar soni
      bathrooms: 2, // Hammomlar soni
      hasGarden: false, // Bog‘ mavjud emas
      location: "Samarqand, Registon",
      additionalDetails: 'Zamonaviy dizayn, yashashga tayyor, katta balkon',
    ),
    Product(
      name: 'Zamonaviy Ofis Binolari',
      price: 350000,
      isAvailable: true,
      off: 30000,
      quantity: 1,
      images: [
        'assets/images/office1.jpg',
        'assets/images/office2.jpg',
        'assets/images/office3.jpg',
      ],
      isFavorite: true,
      rating: 5,
      type: ProductType.office,
      size: 500, // Hajmi (m²)
      rooms: 10, // Xonalar soni
      bedrooms: 0, // Ofis uchun yotoqxona yo‘q
      bathrooms: 4, // Hammomlar soni
      hasGarden: false, // Bog‘ mavjud emas
      location: "Toshkent, Shayxontohur",
      additionalDetails: 'Ofislar, konferensiya zali, to‘liq jihozlangan',
    ),
    Product(
      name: 'Shahar Markazidagi Ofis',
      price: 270000,
      isAvailable: true,
      off: 20000,
      quantity: 1,
      images: [
        'assets/images/office2.jpg',
        'assets/images/office3.jpg',
      ],
      isFavorite: false,
      rating: 4,
      type: ProductType.office,
      size: 400, // Hajmi (m²)
      rooms: 8, // Xonalar soni
      bedrooms: 0, // Ofis uchun yotoqxona yo‘q
      bathrooms: 3, // Hammomlar soni
      hasGarden: false, // Bog‘ mavjud emas
      location: "Buxoro, G‘ijduvon",
      additionalDetails: 'Ko‘p qavatli, zamonaviy ofis, yaxshi lokatsiya',
    ),
  ];

  static List<ProductCategory> categories = [
    ProductCategory(
      type: ProductType.all,
      icon: Icons.apartment,
    ),
    ProductCategory(
      type: ProductType.house,
      icon: Icons.house,
    ),
    ProductCategory(
      type: ProductType.apartment,
      icon: Icons.location_city,
    ),
    ProductCategory(
      type: ProductType.villa,
      icon: FontAwesomeIcons.home,
    ),
    ProductCategory(
      type: ProductType.land,
      icon: Icons.terrain,
    ),
    ProductCategory(
      type: ProductType.office,
      icon: Icons.business,
    ),
    ProductCategory(
      type: ProductType.commercial,
      icon: FontAwesomeIcons.store,
    ),
  ];

  static List<Color> randomColors = [
    const Color(0xFFFCE4EC),
    const Color(0xFFF3E5F5),
    const Color(0xFFEDE7F6),
    const Color(0xFFE3F2FD),
    const Color(0xFFE0F2F1),
    const Color(0xFFF1F8E9),
    const Color(0xFFFFF8E1),
    const Color(0xFFECEFF1),
  ];

  static const Color lightOrangeColor = Color(0xFFEC6813);

  static List<BottomNavBarItem> bottomNavBarItems = [
    const BottomNavBarItem(
      "Bosh sahifa",
      Icon(Icons.home),
    ),
    const BottomNavBarItem(
      "Tanlanganlar",
      Icon(Icons.favorite),
    ),
    const BottomNavBarItem(
      "Buyurtmalar",
      Icon(Icons.shopping_cart),
    ),
    const BottomNavBarItem(
      "Profil",
      Icon(Icons.person),
    ),
  ];

  static List<RecommendedProduct> recommendedProducts = [
    RecommendedProduct(
      cardBackgroundColor: const Color(0xFFEC6813),
    ),
    RecommendedProduct(
      cardBackgroundColor: const Color(0xFF3081E1),
      buttonBackgroundColor: const Color(0xFF9C46FF),
      buttonTextColor: Colors.white,
    ),
  ];
}
