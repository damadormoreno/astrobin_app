import 'dart:async';

import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/models/iss_positioned.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';
import 'base_viewmodel.dart';

class IssViewModel extends BaseViewModel {
  AstrobinRepository _repository;
  IssPositioned _issPositioned;
  IssPositioned get issPositioned => _issPositioned;
  Timer timer;

  IssViewModel(this._repository);

  Future getIssPosition() async {
    setState(ViewState.Loading);
    try {
      _issPositioned = await _repository.fetchIssPosition();
      setState(ViewState.Success);
    } on ServiceError {
      setState(ViewState.Failure);
    } catch (e) {
      setState(ViewState.Failure);
    }
  }
}
