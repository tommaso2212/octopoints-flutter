import 'package:octopoints/model/data/match/Match.dart';
import 'package:octopoints/model/dataaccess/match/MatchDataAccess.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';

class MatchViewModel extends CommonViewModel<Match> {
  MatchViewModel() : super(MatchDataAccess());

  @override
  loadData() async {
    data = await (dataAccess as MatchDataAccess).getMatches();
    super.loadData();
  }

  Future<int> createMatch(String description) async {
    int id = await (dataAccess as MatchDataAccess).createMatch(description);
    loadData();
    return id;
  }

  Future<void> deleteMatch(Match match) async {
    await (dataAccess as MatchDataAccess).deleteMatch(match);
    loadData();
  }
}
