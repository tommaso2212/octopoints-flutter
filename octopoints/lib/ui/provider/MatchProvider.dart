import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/ui/provider/CustomProvider.dart';

class MatchProvider extends CustomProvider<Match> {
  @override
  void loadData() {
    dataAccess.matchDataAccess.getMatches().then(
      (value) {
        data = value;
        notifyListeners();
      },
    );
  }

  Future<int> createMatch(String description) async {
    int id = await dataAccess.matchDataAccess.createMatch(description);
    loadData();
    return id;
  }

  void deleteMatch(Match match) {
    dataAccess.matchDataAccess.deleteMatch(match).then((_) => loadData());
  }
}
