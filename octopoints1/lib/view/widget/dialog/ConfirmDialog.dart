import 'package:flutter/material.dart';
import 'package:octopoints/view/common/ColorPalette.dart';

class ConfirmDialog {
  static Future<bool?> show(BuildContext context, String title) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          backgroundColor: ColorPalette.getLightGrey(),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                'Annulla',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(
                'Si',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
