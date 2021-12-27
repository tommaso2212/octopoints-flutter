import 'package:flutter/rendering.dart';

class ColorPalette {
  static Color getColor() {
    return ([
      Color(0xff2D82B7), //Blue
      Color(0xff42E2B8), //Aquamarine
      Color(0xffF3DFBF), //Almond
      Color(0xffEB8A90), //Coral
    ]..shuffle())
        .first;
  }

  static Color getLightGrey() => Color(0xff2D3339);
  static Color getDarkGrey() => Color(0xff212529);
  static Color getDarkestGrey() => Color(0xff121417);
  static Color getPrimaryColor() => Color(0xffEE6C4D);
}
