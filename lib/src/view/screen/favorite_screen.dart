import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../controller/product_controller.dart';
import '../widget/product_grid_view.dart';
import 'cart_screen.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getFavoriteItems();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tanlanganlar",
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder(
          builder: (ProductController controller) {
            return ProductGridView(
              items: controller.filteredProducts,
              likeButtonPressed: (index) => controller.isFavorite(index),
              isPriceOff: (product) => controller.isPriceOff(product),
            );
          },
        ),
      ),
    );
  }
}
