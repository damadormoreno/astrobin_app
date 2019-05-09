import 'package:astrobin_app/ui/search_for_title/search_for_title_event.dart';
import 'package:astrobin_app/ui/search_for_title/search_for_title_state.dart';
import 'package:bloc/bloc.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:astrobin_app/model/search_title/astrobin_search_error.dart';

class SearchForTitleBloc
    extends Bloc<SearchForTitleEvent, SearchForTitleState> {
  final AstrobinRepository _astrobinRepository;

  SearchForTitleBloc(this._astrobinRepository) : super();

  void onSearchInitiated(String title) {
    dispatch(SearchForTitleInitiated((b) => b..title = title));
  }

  void fetchNextResultPage() {
    dispatch(FetchNextResultPage());
  }

  @override
  SearchForTitleState get initialState => SearchForTitleState.initial();

  Stream<SearchForTitleState> mapSearchInitiated(
      //async* permite el uso de async/await pero lo que retorna es un Stream
      SearchForTitleInitiated event) async* {
    if (event.title.isEmpty) {
      yield SearchForTitleState.initial();
    } else {
      yield SearchForTitleState.loading();

      try {
        final searchResult =
            await _astrobinRepository.searchForTitle(event.title);
        yield SearchForTitleState.success(searchResult);
      } on NoSearchTitleResultsException catch (e) {
        yield SearchForTitleState.failure(e.message);
      } on AstrobinSearchError catch (e) {
        yield SearchForTitleState.failure(e.message);
      }
    }
  }

  Stream<SearchForTitleState> mapFetchNextResultPage() async* {
    try {
      final nextPageResults = await _astrobinRepository.fetchNextResultPage();
      yield SearchForTitleState.success(
          currentState.searchResults + nextPageResults);
    } on NoNextUrlException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchNotInitiatedException catch (e) {
      yield SearchForTitleState.failure(e.message);
    } catch (e) {
      yield SearchForTitleState.failure(e.message);
    }
  }

  @override
  Stream<SearchForTitleState> mapEventToState(
      SearchForTitleEvent event) async* {
    if (event is SearchForTitleInitiated) {
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextResultPage) {
      yield* mapFetchNextResultPage();
    }
  }
}
