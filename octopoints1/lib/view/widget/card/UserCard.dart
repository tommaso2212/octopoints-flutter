import 'package:flutter/material.dart';
import 'RoundedCard.dart';
/*
class UserCard extends RoundedCard {
  final User user;
  final bool showStats;
  UserCard(this.user, {onDelete, onTap, this.showStats = true})
      : super(onTap: onTap, onDelete: onDelete);

  @override
  Widget buildCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: 5,
          ),
          child: Text(
            this.user.username,
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
        showStats
            ? Row(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: Colors.white,
                        ),
                        Text(
                          this.user.win.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.horizontal_rule,
                          color: Colors.white,
                        ),
                        Text(
                          this.user.draw.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.white,
                        ),
                        Text(
                          this.user.lose.toString(),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
*/