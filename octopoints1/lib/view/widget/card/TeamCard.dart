/*

class TeamCard extends StatelessWidget {
  final TeamWithUsers teamWithUsers;
  final onUpdate;
  final onDelete;
  TeamCard(this.teamWithUsers, this.onUpdate, this.onDelete);

  List<Widget> childrens(BuildContext context) {
    TextEditingController partialController =
        TextEditingController(text: this.teamWithUsers.team.partial.toString());
    TextEditingController totalController =
        TextEditingController(text: this.teamWithUsers.team.total.toString());
    List<Widget> list = [];
    list.add(
      Text(
        "Totale:",
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
    list.add(TextField(
      controller: totalController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onTap: () => totalController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: totalController.text.length,
      ),
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          teamWithUsers.team.total = int.parse(value);
          onUpdate();
        }
      },
    ));
    list.add(Text(
      "Parziale:",
      style: TextStyle(
        fontSize: 18,
      ),
    ));
    list.add(TextField(
      controller: partialController,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 34,
      ),
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      onTap: () => partialController.selection = TextSelection(
        baseOffset: 0,
        extentOffset: partialController.text.length,
      ),
      decoration: InputDecoration(
        hintText: '0',
        hintStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          teamWithUsers.team.partial = int.parse(value);
          onUpdate();
        }
      },
    ));

    list.add(
      Expanded(
        child: ListView(
          children: teamWithUsers.users
              .map(
                (e) => UserCard(
                  e,
                  showStats: false,
                  onDelete: () =>
                      ConfirmDialog.show(context, 'Rimuovere dalla squadra?')
                          .then((value) => value!
                              ? context.read<TeamProvider>().leaveTeam(
                                    teamWithUsers.team.id!,
                                    e.id!,
                                  )
                              : null),
                ),
              )
              .toList(),
        ),
      ),
    );
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: ColorPalette.getDarkGrey(),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: this.onDelete,
                icon: Icon(Icons.delete),
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              children: childrens(context),
            ),
          ),
          Positioned.fill(
            bottom: 20,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                color: ColorPalette.getPrimaryColor(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                onPressed: () {
                  context.read<TeamProvider>().getAvailableUsers().then(
                        (value) => CustomBottomSheet<void>().show(
                          context,
                          JoiningBottomSheet(
                            value,
                            (int userId) => context
                                .read<TeamProvider>()
                                .joiningTeam(teamWithUsers.team.id!, userId),
                          ),
                        ),
                      );
                },
                child: Text(
                  'Aggiungi giocatore',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
*/