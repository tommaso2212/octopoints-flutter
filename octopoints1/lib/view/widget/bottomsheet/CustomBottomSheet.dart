import 'package:flutter/material.dart';
import 'package:octopoints/view/common/ColorPalette.dart';

class CustomBottomSheet<T> {
  Future<T?> show(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      backgroundColor: ColorPalette.getDarkGrey(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      context: context,
      builder: (context) => child,
    );
  }
}
