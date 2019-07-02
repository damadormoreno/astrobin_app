import 'package:astrobin_app/core/enums/view_state.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';

import 'base_viewmodel.dart';

class SearchTitleViewModel extends BaseViewModel {
  AstrobinRepository _repository;

  List<AstrobinItem> _astrobinList;
  List<AstrobinItem> get astrobinList => _astrobinList;

  SearchTitleViewModel(this._repository);

  Future getSearchResultsForTitle() async {
    setState(ViewState.Initial);
  }
}
