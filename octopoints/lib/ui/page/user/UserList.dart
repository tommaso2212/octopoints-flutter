import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/ui/card/UserCard.dart';
import 'package:octopoints/ui/common/CommonScaffold.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';
import 'package:octopoints/ui/common/ConfirmDialog.dart';
import 'package:octopoints/ui/modal/CreateModalBottomSheet.dart';
import 'package:octopoints/ui/card/RoundedCard.dart';
import 'package:flutter/material.dart';
import 'package:octopoints/ui/page/user/UserViewModel.dart';

class UserList extends CommonScaffold<User> {
  @override
  UserViewModel initViewModel(BuildContext context) => UserViewModel();

  @override
  RoundedCard createCard(
      BuildContext context, User item, CommonViewModel<User> model) {
    return UserCard(
      item,
      onDelete: () {
        ConfirmDialog.showConfirmDialog(context, 'Eliminare giocatore?').then(
            (value) =>
                value! ? (model as UserViewModel).deleteUser(item) : null);
      },
    );
  }

  @override
  FloatingActionButton createFAB(
      BuildContext context, CommonViewModel<User> model) {
    return FloatingActionButton(
      onPressed: () {
        CreateModalBottomSheet.showCreateModalBottomSheet(
                context, 'Nuovo giocatore', 'Username')
            .then((value) => (model as UserViewModel).createUser(value!));
      },
      child: Icon(Icons.add),
    );
  }
}
