import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
/*
class JoiningBottomSheet extends StatelessWidget {
  final List<User> users;
  final onTap;

  JoiningBottomSheet(this.users, this.onTap);

  List<Widget> childrens(BuildContext context, List<User> users) {
    List<Widget> list = [];
    if (users.isEmpty) {
      list.add(
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 40,
          ),
          child: Text(
            "Non ci sono giocatori disponibili. Crea un nuovo giocatore",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      );
      list.add(
        MaterialButton(
          color: ColorPalette.getPrimaryColor(),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          ),
          child: Text(
            'Aggiungi giocatore',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    } else {
      users.forEach((element) {
        list.add(UserCard(
          element,
          showStats: false,
          onTap: () {
            onTap(element.id);
            Navigator.pop(context);
          },
        ));
      });
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: childrens(context, users),
      ),
    );
  }
}
*/