import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:octopoints/model/dataaccess/DataAccess.dart';

abstract class CustomProvider<T> extends ChangeNotifier {
  @protected
  late DataAccess dataAccess;

  CustomProvider() {
    DataAccess.instance().then(
      (value) {
        dataAccess = value;
        loadData();
      },
    );
  }

  @protected
  List<T> data = [];
  UnmodifiableListView<T> get getData => UnmodifiableListView<T>(data);

  void loadData();
}
