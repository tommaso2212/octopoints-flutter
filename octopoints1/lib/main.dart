import 'package:flutter/material.dart';
import 'package:octopoints/model/AppDatabase.dart';
import 'package:octopoints/view/common/ColorPalette.dart';
import 'package:octopoints/view/page/MatchPage.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Octopoints',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: Typography.whiteMountainView,
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          backgroundColor: ColorPalette.getDarkGrey(),
          actionsIconTheme: IconThemeData(
            color: ColorPalette.getPrimaryColor(),
          ),
          elevation: 15,
          titleTextStyle: TextStyle(
            fontSize: 22,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ColorPalette.getPrimaryColor(),
          elevation: 15,
        ),
        scaffoldBackgroundColor: ColorPalette.getDarkestGrey(),
      ),
      home: Scaffold(
        body: FutureBuilder(
          future: AppDatabase.init(), //async db init
          builder: (_, snapshot) =>
              snapshot.connectionState == ConnectionState.done
                  ? MatchPage()
                  : Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Octopoints',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 40,
                              ),
                            ),
                          ),
                          CircularProgressIndicator(
                            color: ColorPalette.getPrimaryColor(),
                          ),
                        ],
                      ),
                    ),
        ),
      ),
    ),
  );
}
