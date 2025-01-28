import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:home/src/model/search_bar.dart';

import '../../../core/app_color.dart';
import '../../../core/app_data.dart';
import '../../controller/product_controller.dart';
import '../widget/list_item_selector.dart';
import '../widget/product_grid_view.dart';

final ProductController controller = Get.put(ProductController());

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: ProductSearchBar(
        products: controller.allProducts,
        onSearchResults: (results) {
          controller.filteredProducts.assignAll(results);
          controller.update();
        },
      ),
    );
  }

  Widget _recommendedProductListView(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: AppData.recommendedProducts.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: AppData.recommendedProducts[index].cardBackgroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  AppData.recommendedProducts[index].imagePath,
                  height: 170,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _topCategoriesHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Katalog",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColor.primary),
            child: Text(
              "BARCHASI",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                // ignore: deprecated_member_use
                color: Colors.deepOrange.withOpacity(0.7),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _topCategoriesListView() {
    return ListItemSelector(
      categories: controller.categories,
      onItemPressed: (index) {
        controller.filterItemsByCategory(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    controller.getAllItems();
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello Bahodir",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                Text(
                  "Sizga mos uylarni topishda yordam bera olamiz!",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                _recommendedProductListView(context),
                _topCategoriesHeader(context),
                _topCategoriesListView(),
                GetBuilder<ProductController>(
                  builder: (controller) {
                    return ProductGridView(
                      items: controller.filteredProducts,
                      likeButtonPressed: (index) => controller.isFavorite(index),
                      isPriceOff: (product) => controller.isPriceOff(product),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
