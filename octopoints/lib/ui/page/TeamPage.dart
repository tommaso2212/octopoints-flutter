import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octopoints/ui/page/CustomScaffold.dart';

class TeamPage extends StatelessWidget {
  final String _title;

  TeamPage(this._title);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      AppBar(
        title: Text(
          _title,
        ),
      ),
      () {},
      Container(),
    );
  }
}
