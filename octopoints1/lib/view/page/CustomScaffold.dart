import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final AppBar _appBar;
  final _onPressedFAB;
  final Widget _body;

  CustomScaffold(this._appBar, this._onPressedFAB, this._body);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: this._appBar,
      floatingActionButton: FloatingActionButton(
        onPressed: this._onPressedFAB,
        child: Icon(
          Icons.add,
        ),
      ),
      body: this._body,
    );
  }
}
