import 'package:flutter/material.dart';
import 'package:octopoints/model/entity/MatchEntity.dart';
import 'package:octopoints/viewmodel/cache/Cache.dart';
import 'package:octopoints/viewmodel/cache/MatchWithTeams.dart';

class HomePageProvider extends ChangeNotifier {
  Future<List<MatchWithTeams>> get matches => Cache().matches;

  void handleCreate(String description) =>
      Cache().addMatch(description).then((_) => notifyListeners());

  void handleDelete(MatchEntity match) =>
      Cache().deleteMatch(match).then((_) => notifyListeners());
}
