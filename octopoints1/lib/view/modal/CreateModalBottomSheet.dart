import 'package:flutter/material.dart';
import 'package:octopoints/view/common/ColorPalette.dart';

class CreateModalBottomSheet {
  static Future<String?> showCreateModalBottomSheet(
      BuildContext context, String title, String inputField) {
    TextEditingController _controller = TextEditingController();
    return showModalBottomSheet<String>(
      isScrollControlled: true,
      backgroundColor: ColorPalette.getLightGrey(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: inputField,
                    hintStyle: TextStyle(color: Colors.white),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: MaterialButton(
                  color: ColorPalette.getPrimaryColor(),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
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
