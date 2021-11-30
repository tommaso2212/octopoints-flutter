import 'package:flutter/material.dart';
import 'package:octopoints/model/data/team/Team.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'RoundedCard.dart';

class TeamCard extends RoundedCard {
  final TeamWithUsers teamWithUsers;
  final onUpdate;
  TeamCard(this.teamWithUsers, this.onUpdate(Team value), {onTap, onDelete})
      : super(onTap: onTap, onDelete: onDelete);

  List<Widget> userList(List<User> users) {
    List<Widget> userItems = [];
    users.forEach((element) {
      userItems.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            element.username,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
        ),
      );
    });
    return userItems;
  }

  @override
  Widget buildCard() {
    TextEditingController _partialController =
        TextEditingController(text: this.teamWithUsers.team.partial.toString());
    TextEditingController _totalController =
        TextEditingController(text: this.teamWithUsers.team.total.toString());
    return Row(
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Par.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Container(
              width: 50,
              padding: EdgeInsets.only(bottom: 10),
              child: TextField(
                controller: _partialController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onTap: () => _partialController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _partialController.text.length,
                ),
                onSubmitted: (value) {
                  if (value != '') {
                    this.teamWithUsers.team.partial = int.parse(value);
                    this.onUpdate(this.teamWithUsers.team);
                  }
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.black),
                  border: InputBorder.none,
                ),
              ),
            ),
            Text(
              'Tot.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            Container(
              width: 50,
              child: TextField(
                controller: _totalController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                onTap: () => _totalController.selection = TextSelection(
                  baseOffset: 0,
                  extentOffset: _totalController.text.length,
                ),
                onSubmitted: (value) {
                  if (value != '') {
                    this.teamWithUsers.team.total = int.parse(value);
                    this.onUpdate(this.teamWithUsers.team);
                  }
                },
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            children: userList(this.teamWithUsers.users),
          ),
        ),
      ],
    );
  }
}
