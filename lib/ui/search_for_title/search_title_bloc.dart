
import 'package:bloc/bloc.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';


class SearchTitleBloc extends Bloc<SearchTitleEvent, SearchTitleState> {

  final AstrobinRepository _astrobinRepository;

  SearchTitleBloc(this._astrobinRepository) : super();

    void onSearchInitiated(String title) {
    dispatch(SearchTitleInitiated((b) => b..title = title));
  }

  void fetchNextResultPage() {
    dispatch(FetchNextResultPage());
  }

  @override
  SearchTitleState get initialState => SearchTitleState.initial();

    Stream<SearchTitleState> mapSearchInitiated(SearchTitleInitiated event) async* {
    if (event.query.isEmpty) {
      yield SearchTitleState.initial();
    } else {
      yield SearchTitleState.loading();

      try {
        final searchResult = await _astrobinRepository.searchForTitle(event.query);
        yield SearchTitleState.success(searchResult);
      } on AstrobinSearchError catch (e) {
        yield SearchTitleState.failure(e.message);
      } on NoSearchTitleResultsException catch (e) {
        yield SearchTitleState.failure(e.message);
      }
    }
  }

}