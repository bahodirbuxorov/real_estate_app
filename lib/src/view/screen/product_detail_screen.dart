import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/app_color.dart'; // ✅ AppColor import qilindi
import '../../controller/product_controller.dart';
import '../../model/product.dart';
import '../widget/carousel_slider.dart';

final ProductController controller = Get.put(ProductController());

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen(this.product, {super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back, color: AppColor.darkText), // ✅ Rang moslashtirildi
      ),
    );
  }

  Widget productPageView(double width, double height) {
    return Container(
      height: height * 0.45,
      width: width,
      decoration: const BoxDecoration(
        color: AppColor.background, // ✅ Background rang AppColor dan olindi
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: CarouselSlider(items: product.images),
        ),
      ),
    );
  }

  Widget _ratingBar(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: product.rating,
          direction: Axis.horizontal,
          itemSize: 20,
          itemBuilder: (_, __) => const FaIcon(
            FontAwesomeIcons.solidStar,
            color: AppColor.star, // ✅ Yulduzcha rangi AppColor dan olindi
          ),
          onRatingUpdate: (_) {},
        ),
        const SizedBox(width: 10),
        Text(
          "(4500 Reviews)",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }

  Widget _productDetails(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.cardBackground, // ✅ Karta foni moslashtirildi
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.border), // ✅ Border rangi AppColor dan olindi
      ),
      child: Column(
        children: [
          _detailRow("Hajmi:", "${product.size} m²"),
          _detailRow("Xonalar soni:", "${product.rooms}"),
          _detailRow("Yotoqxonalar:", "${product.bedrooms}"),
          _detailRow("Hammomlar:", "${product.bathrooms}"),
          _detailRow("Joylashuv:", product.location),
          _detailRow("Bog‘:", product.hasGarden ? "Ha" : "Yo‘q"),
          _detailRow("Qo‘shimcha:", product.additionalDetails),
        ],
      ),
    );
  }

  Widget _detailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Flexible(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  Widget _priceSection(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (product.off != null)
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: AppColor.primary, // ✅ Chegirma foni moslashtirildi
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "-${((product.off! / product.price) * 100).toInt()}%",
                  style: const TextStyle(color: AppColor.lightText, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(width: 10),
            Text(
              "\$${product.off ?? product.price}",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(width: 5),
            if (product.off != null)
              Text(
                "\$${product.price}",
                style: const TextStyle(
                  decoration: TextDecoration.lineThrough,
                  color: AppColor.greyText, // ✅ O'chirilgan narx rangi moslashtirildi
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
        Text(
          product.isAvailable ? "Mavjud" : "Yo‘q",
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _actionButton() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 500),
      opacity: product.isAvailable ? 1.0 : 0.5,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.shopping_cart, color: AppColor.lightText),
        label: const Text("Savatchaga qo'shish", style: TextStyle(color: AppColor.lightText),),
        style: ElevatedButton.styleFrom(backgroundColor: AppColor.primary), // ✅ Tugma rangi moslashtirildi
        onPressed: product.isAvailable ? () => controller.addToCart(product) : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    productPageView(width, height),
                    const SizedBox(height: 20),
                    Text(
                      product.name,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: 10),
                    _ratingBar(context),
                    const SizedBox(height: 10),
                    _priceSection(context),
                    const SizedBox(height: 30),
                    Text(
                      "Tafsilotlar",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 10),
                    _productDetails(context),
                    const SizedBox(height: 20),
                    _actionButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
