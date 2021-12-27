import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
/*
class TeamPage extends StatelessWidget {
  final Match _match;

  TeamPage(this._match);

  List<Widget> teams(BuildContext context) {
    List<Widget> list = [];
    context.watch<TeamProvider>().getData.forEach((element) {
      list.add(
        TeamCard(
          element,
          () => context.read<TeamProvider>().updateTeam(element),
          () => ConfirmDialog.show(context, 'Eliminare squadra?').then(
              (value) => value!
                  ? context.read<TeamProvider>().deleteTeam(element)
                  : null),
        ),
      );
    });
    return list;
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return ChangeNotifierProvider(
      create: (context) => TeamProvider(_match),
      builder: (context, _) => CustomScaffold(
        AppBar(
          title: Text(
            _match.description,
          ),
        ),
        () => context.read<TeamProvider>().createTeam(),
        PageView(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          children: teams(context),
        ),
      ),
    );
  }
}
*/