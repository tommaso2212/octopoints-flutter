import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/data/team/TeamWithUsers.dart';
import 'package:octopoints/ui/provider/CustomProvider.dart';

class TeamProvider extends CustomProvider<TeamWithUsers> {
  final Match _match;

  TeamProvider(this._match);

  @override
  void loadData() {
    dataAccess.teamDataAccess.getTeams(_match.id!).then(
      (value) {
        data = value;
        notifyListeners();
      },
    );
  }
}
