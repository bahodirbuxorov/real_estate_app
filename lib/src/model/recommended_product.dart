
import 'package:flutter/material.dart' show Color, Colors;

import '../../core/app_color.dart';

class RecommendedProduct {
  Color? cardBackgroundColor;
  Color? buttonTextColor;
  Color? buttonBackgroundColor;
  String imagePath;

  RecommendedProduct({
    this.cardBackgroundColor,
    this.buttonTextColor = AppColor.primary,
    this.buttonBackgroundColor = Colors.white,
    this.imagePath = "assets/images/shop.png",
  });
}
