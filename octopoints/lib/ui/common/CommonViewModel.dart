import 'package:flutter/cupertino.dart';
import 'package:octopoints/model/dataaccess/DataAccess.dart';

class CommonViewModel<T> extends ChangeNotifier {
  late final dynamic dataAccess;

  List<T> data = [];

  CommonViewModel(this.dataAccess) {
    initDataAccess();
  }

  void initDataAccess() async {
    await (dataAccess as DataAccess).initDb();
    loadData();
  }

  void loadData() async {
    notifyListeners();
  }
}
