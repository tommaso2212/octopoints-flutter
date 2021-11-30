import 'package:flutter/material.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';
import 'package:octopoints/ui/page/MatchPage.dart';
import 'package:octopoints/ui/provider/MatchProvider.dart';
import 'package:octopoints/ui/provider/UserProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Octopoints());
}

class Octopoints extends StatefulWidget {
  @override
  _OctopointsState createState() => _OctopointsState();
}

class _OctopointsState extends State<Octopoints> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MatchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      builder: (context, _) => MaterialApp(
        title: 'Octopoints',
        home: MatchPage(),
        theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
                displayColor: Colors.white,
              ),
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
      ),
    );
  }
}
