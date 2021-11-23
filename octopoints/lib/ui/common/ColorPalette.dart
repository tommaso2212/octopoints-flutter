import 'package:flutter/rendering.dart';

class ColorPalette {
  static Color getColor() {
    return ([
      Color(0xffF3DD49),
      Color(0xff28B87C),
      Color(0xff1FAD93),
      Color(0xffE6B28F)
    ]..shuffle())
        .first;
  }

  static Color getLightGrey() => Color(0xff171717);
  static Color getDarkGrey() => Color(0xff101010);
}
