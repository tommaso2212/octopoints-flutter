import 'package:flutter/material.dart';
import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/ui/card/TeamCard.dart';
import 'package:octopoints/ui/common/CommonScaffold.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';
import 'package:octopoints/ui/common/ConfirmDialog.dart';
import 'package:octopoints/ui/card/RoundedCard.dart';
import 'package:octopoints/ui/modal/TeamBottomSheet.dart';
import 'package:octopoints/ui/page/team/TeamViewModel.dart';

class TeamList extends CommonScaffold<TeamWithUsers> {
  final Match _match;
  TeamList(this._match);

  @override
  TeamViewModel initViewModel(BuildContext context) =>
      TeamViewModel(this._match.id!);

  @override
  AppBar createAppBar(BuildContext context,
      {String title = '', List<Widget>? actions}) {
    return super.createAppBar(context, title: this._match.description);
  }

  @override
  RoundedCard createCard(BuildContext context, TeamWithUsers item,
      CommonViewModel<TeamWithUsers> model) {
    return TeamCard(
      item,
      (team) {
        (model as TeamViewModel).updateTeam(team);
      },
      onTap: () {
        TeamBottomSheet.showTeamBottomSheet(
            context, item, (model as TeamViewModel));
      },
      onDelete: () {
        ConfirmDialog.showConfirmDialog(context, 'Eliminare squadra?').then(
          (value) =>
              value! ? (model as TeamViewModel).deleteTeam(item.team) : null,
        );
      },
    );
  }

  @override
  FloatingActionButton createFAB(
      BuildContext context, CommonViewModel<TeamWithUsers> model) {
    return FloatingActionButton(
      onPressed: () => (model as TeamViewModel).createTeam(),
      child: Icon(Icons.add),
    );
  }
}
