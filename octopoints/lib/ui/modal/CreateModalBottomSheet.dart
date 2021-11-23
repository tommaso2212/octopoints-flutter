import 'package:flutter/material.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';

class CreateModalBottomSheet {
  static Future<String?> showCreateModalBottomSheet(
      BuildContext context, String title, String inputField) {
    TextEditingController _controller = TextEditingController();
    return showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: ColorPalette.getLightGrey(),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: TextField(
                  controller: _controller,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  decoration: InputDecoration(
                      hintText: inputField,
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: MaterialButton(
                  color: Colors.accents.first,
                  onPressed: _controller.text == ''
                      ? null
                      : () => Navigator.pop(context, _controller.text),
                  child: Text(
                    'Conferma',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
