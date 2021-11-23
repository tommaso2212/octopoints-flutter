import 'package:flutter/material.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/ui/card/UserCard.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';
import 'package:octopoints/ui/page/team/TeamViewModel.dart';

class TeamBottomSheetWidget extends StatefulWidget {
  final TeamViewModel model;
  final TeamWithUsers team;

  TeamBottomSheetWidget(this.model, this.team);

  @override
  _TeamBottomSheetState createState() => _TeamBottomSheetState(this.team.users);
}

class _TeamBottomSheetState extends State<TeamBottomSheetWidget> {
  var users = <User>[];

  _TeamBottomSheetState(this.users);

  var addUser = false;

  void updateState(List<User> listUser) {
    setState(() {
      addUser = true;
      users = listUser;
    });
  }

  List<Widget> buildUsers(
      List<User> users, onTap(User user), onDelete(User user)) {
    if (users.isNotEmpty) {
      return users
          .map(
            (e) => UserCard(
              e,
              onTap: () => onTap(e),
              onDelete: () => onDelete(e),
              showStats: false,
            ),
          )
          .toList();
    }
    return [
      Center(
          child: Text(
        'Nessun giocatore disponibile.',
        style: TextStyle(color: Colors.white, fontSize: 24),
      ))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(
        children: [
          Expanded(
            child: Column(
              children: !addUser
                  ? buildUsers(users, (user) {}, (user) {
                      widget.model
                          .leaveTeam(widget.team.team.id!, user.id!)
                          .then((value) => Navigator.pop(context));
                    })
                  : buildUsers(users, (user) {
                      widget.model
                          .joinTeam(widget.team.team.id!, user.id!)
                          .then((value) => Navigator.pop(context));
                    }, (user) {}),
            ),
          ),
          !addUser
              ? Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: MaterialButton(
                    color: Colors.accents.first,
                    onPressed: () {
                      widget.model.getAvailableUsers().then((value) {
                        updateState(value);
                      });
                    },
                    child: Text(
                      'Aggiungi giocatore',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class TeamBottomSheet {
  static Future<void> showTeamBottomSheet(
      BuildContext context, TeamWithUsers team, TeamViewModel model) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: ColorPalette.getLightGrey(),
      context: context,
      builder: (context) {
        return TeamBottomSheetWidget(model, team);
      },
    );
  }
}
