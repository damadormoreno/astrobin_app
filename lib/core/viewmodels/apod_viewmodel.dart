import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/models/apodItem.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';

import 'base_viewmodel.dart';

class ApodViewModel extends BaseViewModel {
  AstrobinRepository _repository;
  ApodItem _apodItem;
  ApodItem get apodItem => _apodItem;

  ApodViewModel(this._repository);

  Future getApodNasa() async {
    setState(ViewState.Loading);
    try {
      _apodItem = await _repository.fetchApodNasa();
      setState(ViewState.Success);
    } on ServiceError {
      setState(ViewState.Failure);
    } catch (e) {
      setState(ViewState.Failure);
    }
  }
}
