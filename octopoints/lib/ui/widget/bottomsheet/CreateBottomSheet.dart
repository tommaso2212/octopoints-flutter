import 'package:flutter/material.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';

class CreateBottomSheet extends StatefulWidget {
  final String title;

  CreateBottomSheet(this.title);

  @override
  _CreateBottomSheetState createState() => _CreateBottomSheetState();
}

class _CreateBottomSheetState extends State<CreateBottomSheet> {
  TextEditingController _controller = TextEditingController();

  late bool _isValid;

  @override
  void initState() {
    setState(() {
      _isValid = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: _controller,
              onChanged: (text) => this.setState(
                () {
                  text != "" ? _isValid = true : _isValid = false;
                },
              ),
              textAlign: TextAlign.center,
              autofocus: true,
              decoration: InputDecoration(
                hintText: widget.title,
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
              disabledColor: ColorPalette.getPrimaryColor().withAlpha(150),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              onPressed: _isValid
                  ? () => Navigator.pop(context, _controller.text)
                  : null,
              child: Text(
                'Conferma',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
