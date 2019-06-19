import 'package:astrobin_app/core_refactor/enums/view_state.dart';
import 'package:astrobin_app/core_refactor/models/astrobin_item.dart';
import 'package:astrobin_app/core_refactor/repositories/astrobin_repository.dart';
import 'package:astrobin_app/core_refactor/exceptions/exceptions.dart';

import 'base_viewmodel.dart';

class PodViewModel extends BaseViewModel {
  AstrobinRepository _repository;
  AstrobinItem _podItem;
  AstrobinItem get podItem => _podItem;

  PodViewModel(this._repository);

  Future getApodNasa() async {
    setState(ViewState.Loading);
    try {
      _podItem = await _repository.fetchPod();
      setState(ViewState.Success);
    } on ServiceError {
      setState(ViewState.Failure);
    } catch (e) {
      setState(ViewState.Failure);
    }
  }
}
