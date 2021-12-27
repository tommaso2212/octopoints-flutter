import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octopoints/view/common/ColorPalette.dart';

abstract class RoundedCard extends StatelessWidget {
  final onTap;
  final onDelete;

  RoundedCard({this.onTap, this.onDelete});

  Widget buildCard();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [.05, .05],
            colors: [
              ColorPalette.getColor(),
              ColorPalette.getLightGrey(),
            ],
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(child: buildCard()),
            IconButton(
              onPressed: this.onDelete,
              icon: Icon(Icons.delete),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
