import 'package:astrobin_app/core_refactor/enums/view_state.dart';
import 'package:flutter/widgets.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.Initial;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
