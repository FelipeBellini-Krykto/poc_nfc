import 'package:flutter/material.dart';
import 'package:module_commons/commons.dart';
import 'package:module_external_dependencies/mobx_triple.dart';

class NfcScaffoldWidget<TStore extends BaseStore<TState>, TState extends Object> extends StatelessWidget {
  final TStore store;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? floatingActionButton;
  final bool extendBodyBehindAppBar;
  final bool extendBody;
  final Color backgroundColor;
  final double? progressIndicatorValue;

  const NfcScaffoldWidget({
    super.key,
    required this.body,
    required this.store,
    this.floatingActionButton,
    this.progressIndicatorValue,
    this.backgroundColor = NfcColors.scaffoldBackground,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
  });

  void _onError(error) {}

  void _listener(BuildContext context, Triple<TState> triple) {
    switch (triple.event) {
      case TripleEvent.error:
        _onError(triple.error);
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TripleConsumer<TStore, Exception, TState>(
        store: store,
        listener: _listener,
        builder: (_, triple) => Scaffold(
            backgroundColor: backgroundColor,
            extendBody: extendBody,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            appBar: appBar,
            body: body,
            bottomNavigationBar: bottomNavigationBar,
            bottomSheet: bottomSheet,
            floatingActionButton: floatingActionButton));
  }
}
