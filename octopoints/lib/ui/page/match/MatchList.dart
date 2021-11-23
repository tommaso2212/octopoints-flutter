import 'package:flutter/material.dart';
import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/ui/card/MatchCard.dart';
import 'package:octopoints/ui/common/CommonScaffold.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';
import 'package:octopoints/ui/common/ConfirmDialog.dart';
import 'package:octopoints/ui/modal/CreateModalBottomSheet.dart';
import 'package:octopoints/ui/card/RoundedCard.dart';
import 'package:octopoints/ui/page/match/MatchViewModel.dart';
import 'package:octopoints/ui/page/team/TeamList.dart';
import 'package:octopoints/ui/page/user/UserList.dart';

class MatchList extends CommonScaffold<Match> {
  @override
  MatchViewModel initViewModel(BuildContext context) => MatchViewModel();

  @override
  AppBar createAppBar(BuildContext context,
      {String title = 'Octopoints', List<Widget>? actions}) {
    actions = [];
    actions.add(
      IconButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserList(),
          ),
        ),
        icon: Icon(Icons.supervised_user_circle),
      ),
    );
    return super.createAppBar(context, actions: actions);
  }

  @override
  RoundedCard createCard(
      BuildContext context, Match item, CommonViewModel<Match> model) {
    return MatchCard(
      item,
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeamList(item),
        ),
      ),
      onDelete: () {
        ConfirmDialog.showConfirmDialog(context, 'Eliminare partita?').then(
            (value) =>
                value! ? (model as MatchViewModel).deleteMatch(item) : null);
      },
    );
  }

  @override
  FloatingActionButton createFAB(
      BuildContext context, CommonViewModel<Match> model) {
    return FloatingActionButton(
      onPressed: () {
        CreateModalBottomSheet.showCreateModalBottomSheet(
                context, 'Nuova partita', 'Descrizione')
            .then((value) => (model as MatchViewModel).createMatch(value!));
      },
      child: Icon(Icons.add),
    );
  }
}
