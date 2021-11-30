import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/ui/page/CustomScaffold.dart';
import 'package:octopoints/ui/page/TeamPage.dart';
import 'package:octopoints/ui/page/UserPage.dart';
import 'package:octopoints/ui/provider/MatchProvider.dart';
import 'package:octopoints/ui/widget/bottomsheet/CreateBottomSheet.dart';
import 'package:octopoints/ui/widget/bottomsheet/CustomBottomSheet.dart';
import 'package:octopoints/ui/widget/card/MatchCard.dart';
import 'package:octopoints/ui/widget/dialog/ConfirmDialog.dart';
import 'package:provider/provider.dart';

class MatchPage extends StatelessWidget {
  List<Widget> childrens(BuildContext context) {
    List<Widget> list = [];
    context
        .select<MatchProvider, List<Match>>((value) => value.getData)
        .forEach((element) {
      list.add(
        MatchCard(
          element,
          onDelete: () => ConfirmDialog.show(context, 'Eliminare partita?')
              .then((value) => value!
                  ? context.read<MatchProvider>().deleteMatch(element)
                  : null),
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TeamPage(element.description),
            ),
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
        title: Text(
          'Octopoints',
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserPage(),
              ),
            ),
            icon: Icon(
              Icons.supervised_user_circle,
              size: 35,
            ),
          ),
        ],
      ),
      () => CustomBottomSheet<String>()
          .show(
        context,
        CreateBottomSheet('Nuova partita'),
      )
          .then(
        (value) {
          if (value != null && value.isNotEmpty) {
            context.read<MatchProvider>().createMatch(value);
          }
        },
      ),
      SingleChildScrollView(
        child: Column(
          children: childrens(context),
        ),
      ),
    );
  }
}
