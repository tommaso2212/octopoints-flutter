import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octopoints/model/data/user/User.dart';
import 'package:octopoints/ui/page/CustomScaffold.dart';
import 'package:octopoints/ui/provider/UserProvider.dart';
import 'package:octopoints/ui/widget/bottomsheet/CreateBottomSheet.dart';
import 'package:octopoints/ui/widget/bottomsheet/CustomBottomSheet.dart';
import 'package:octopoints/ui/widget/card/UserCard.dart';
import 'package:octopoints/ui/widget/dialog/ConfirmDialog.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  List<Widget> childrens(BuildContext context) {
    List<Widget> list = [];
    context
        .select<UserProvider, List<User>>((value) => value.getData)
        .forEach((element) {
      list.add(
        UserCard(
          element,
          onDelete: () =>
              ConfirmDialog.show(context, 'Eliminare giocatore?').then(
            (value) => value!
                ? context.read<UserProvider>().deleteUser(element)
                : null,
          ),
        ),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      AppBar(
        title: Text('Giocatori'),
      ),
      () => CustomBottomSheet<String>()
          .show(
            context,
            CreateBottomSheet('Nuova partita'),
          )
          .then(
            (value) => context.read<UserProvider>().createUser(value!),
          ),
      SingleChildScrollView(
        child: Column(
          children: childrens(context),
        ),
      ),
    );
  }
}
