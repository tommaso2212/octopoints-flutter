import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:octopoints/ui/common/ColorPalette.dart';
import 'package:octopoints/ui/common/CommonViewModel.dart';
import 'package:octopoints/ui/card/RoundedCard.dart';
import 'package:provider/provider.dart';

abstract class CommonScaffold<T> extends StatefulWidget {
  CommonViewModel<T> initViewModel(BuildContext context);

  RoundedCard createCard(
      BuildContext context, T item, CommonViewModel<T> model);

  FloatingActionButton createFAB(
      BuildContext context, CommonViewModel<T> model);

  AppBar createAppBar(BuildContext context,
      {String title = 'Octopoints', List<Widget>? actions}) {
    return AppBar(
      title: Text(title),
      backgroundColor: ColorPalette.getDarkGrey(),
      actions: actions,
    );
  }

  List<Widget> buildChildrens(BuildContext context, CommonViewModel<T> model) {
    List<Widget> children = [];
    model.data.forEach((element) {
      children.add(createCard(context, element, model));
    });
    return children;
  }

  @override
  _CommonScaffoldState<T> createState() => _CommonScaffoldState<T>();
}

class _CommonScaffoldState<T> extends State<CommonScaffold<T>> {
  late CommonViewModel<T> viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.initViewModel(context);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CommonViewModel<T>>.value(
      value: viewModel,
      child: Scaffold(
        appBar: widget.createAppBar(context),
        body: Consumer<CommonViewModel<T>>(
          builder: (context, model, _) {
            return SingleChildScrollView(
              child: Column(
                children: widget.buildChildrens(context, model),
              ),
            );
          },
        ),
        floatingActionButton: Consumer<CommonViewModel<T>>(
          builder: (context, model, _) {
            return widget.createFAB(context, model);
          },
        ),
        backgroundColor: ColorPalette.getLightGrey(),
      ),
    );
  }
}
