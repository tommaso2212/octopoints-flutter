import 'package:flutter/material.dart';
import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/ui/card/RoundedCard.dart';

class MatchCard extends RoundedCard {
  final Match match;

  MatchCard(this.match, {onTap, onDelete})
      : super(onTap: onTap, onDelete: onDelete);

  @override
  Widget buildCard() {
    return Text(
      this.match.description,
      style: TextStyle(
        color: Colors.black,
        fontSize: 24,
      ),
    );
  }
}
