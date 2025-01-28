import 'package:flutter/material.dart' show Color, Colors;

class AppColor {
  const AppColor._();

  // ✅ Asosiy ranglar
  static const Color primary = Color(0xFFEC6813); // Dark Orange
  static const Color secondary = Color(0xFFf8b89a); // Light Orange

  // ✅ Matn va fon ranglari
  static const Color darkText = Colors.black;
  static const Color lightText = Colors.white;
  static const Color greyText = Color(0xFFA6A3A0);
  static const Color background = Color(0xFFE5E6E8);
  static const Color cardBackground = Colors.white;

  // ✅ Qo'shimcha ranglar
  static const Color border = Colors.grey;
  static const Color iconColor = Color(0xFF616161);
  static const Color disabled = Color(0xFFBDBDBD);
  static const Color star = Colors.amber;
}
