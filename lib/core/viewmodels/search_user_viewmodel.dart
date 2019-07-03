import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';

import 'base_viewmodel.dart';

class SearchUserViewModel extends BaseViewModel {
  AstrobinRepository _repository;

  String _error;
  String get error => _error;
  bool _hasReachedEndOfResults = false;
  bool get hasReachedEndOfResults => _hasReachedEndOfResults;

  List<AstrobinItem> _astrobinList;
  List<AstrobinItem> get astrobinList => _astrobinList;

  SearchUserViewModel(this._repository);

  Future getSearchResultsForUser(String title) async {
    setState(ViewState.Loading);
    try {
      _astrobinList = await _repository.searchForUserRefactor(title);
      setState(ViewState.Success);
    } on NoSearchTitleResultsException catch (_) {
      _error = "No se han encontrado resultados";
      setState(ViewState.Failure);
    } catch (e) {
      _error = "Ha ocurrido un error";
      setState(ViewState.Failure);
    }
  }

  Future fetchNextResultsForUser() async {
    try {
      final nextPageResults =
          await _repository.fetchNextResultPageUserRefactor();
      _astrobinList = _astrobinList + nextPageResults;
      setState(ViewState.Success);
    } on NoNextUrlException catch (_) {
      _hasReachedEndOfResults = true;
      setState(ViewState.EndOfResults);
    } catch (e) {
      setState(ViewState.Failure);
    }
  }
}
