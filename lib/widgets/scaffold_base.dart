import 'package:flutter/material.dart';
import 'package:free_dictionary/l10n/l10n.dart';

class ScaffoldBase extends StatelessWidget {
  const ScaffoldBase({
    super.key,
    required this.builder,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.drawer,
    this.endDrawer,
    this.backgroundColor,
  });

  final Widget Function(BuildContext context, AppLocalizations l10n) builder;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Widget? drawer;
  final Widget? endDrawer;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLocalizations>(
      valueListenable: l10nNotifier,
      builder: (context, l10n, _) {
        return Scaffold(
          appBar: appBar,
          body: builder(context, l10n),
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          bottomNavigationBar: bottomNavigationBar,
          drawer: drawer,
          endDrawer: endDrawer,
          backgroundColor: backgroundColor,
        );
      },
    );
  }
}
