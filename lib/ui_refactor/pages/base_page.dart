import 'package:astrobin_app/core_refactor/viewmodels/base_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kiwi/kiwi.dart' as kiwi;

class BasePage<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  BasePage({this.builder, this.onModelReady});

  @override
  State<StatefulWidget> createState() => _BasePageState<T>();
}

class _BasePageState<T extends BaseViewModel> extends State<BasePage<T>> {
  T model = kiwi.Container().resolve<T>();

  @override
  void initState() {
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      builder: (context) => model,
      child: Consumer<T>(builder: widget.builder),
    );
  }
}
