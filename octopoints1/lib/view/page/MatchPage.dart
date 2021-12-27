import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
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
              builder: (context) => TeamPage(element),
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
*/