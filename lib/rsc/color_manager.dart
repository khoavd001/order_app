import 'package:flutter/material.dart';

class ColorsApp {
  static Color redOrigin = HexColor.fromHex('#FF7058');
  static Color textColor = HexColor.fromHex('#010F07');
  static Color boxShadow = HexColor.fromHex('#F4F6FA');
  static Color subTitle = HexColor.fromHex('#868686');
}

extension HexColor on Color {
  static Color fromHex(String hex) {
    hex = hex.replaceAll('#', '');
    if (hex.length == 6) {
      hex = "FF" + hex; // 8 char with opacity 100%
    }
    return Color(int.parse(hex, radix: 16));
  }
}
