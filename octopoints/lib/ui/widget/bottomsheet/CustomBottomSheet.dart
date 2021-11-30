import 'package:flutter/material.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';

class CustomBottomSheet<T> {
  Future<T?> show(BuildContext context, Widget child) {
    return showModalBottomSheet<T>(
      isScrollControlled: true,
      backgroundColor: ColorPalette.getLightGrey(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      context: context,
      builder: (context) => child,
    );
  }
}
