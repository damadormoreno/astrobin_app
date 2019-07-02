import 'package:astrobin_app/ui/search_for_user/search_user_event.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_state.dart';
import 'package:bloc/bloc.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';
import 'package:astrobin_app/core/exceptions/astrobin_search_error.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';

class SearchUserBloc extends Bloc<SearchUserEvent, SearchUserState> {
  final AstrobinRepository _astrobinRepository;

  SearchUserBloc(this._astrobinRepository) : super();

  void onSearchInitiated(String user) {
    dispatch(SearchUserInitiated((b) => b..user = user));
  }

  void fetchNextUserResultPage() {
    dispatch(FetchNextUserResultPage());
  }

  @override
  SearchUserState get initialState => SearchUserState.initial();

  Stream<SearchUserState> mapSearchInitiated(SearchUserInitiated event) async* {
    if (event.user.isEmpty) {
      yield SearchUserState.initial();
    } else {
      yield SearchUserState.loading();

      try {
        final searchResult =
            await _astrobinRepository.searchForUser(event.user);
        yield SearchUserState.success(searchResult);
      } on NoSearchUserResultsException catch (e) {
        yield SearchUserState.failure(e.message);
      } on AstrobinSearchError catch (e) {
        yield SearchUserState.failure(e.message);
      }
    }
  }

  Stream<SearchUserState> mapFetchNextUserResultPage() async* {
    try {
      final nextPageResults =
          await _astrobinRepository.fetchNextUserResultPage();
      yield SearchUserState.success(
          currentState.searchResults + nextPageResults);
    } on NoNextUrlException catch (_) {
      yield currentState.rebuild((b) => b..hasReachedEndOfResults = true);
    } on SearchNotInitiatedException catch (e) {
      yield SearchUserState.failure(e.message);
    } catch (e) {
      yield SearchUserState.failure(e.message);
    }
  }

  @override
  Stream<SearchUserState> mapEventToState(SearchUserEvent event) async* {
    if (event is SearchUserInitiated) {
      yield* mapSearchInitiated(event);
    } else if (event is FetchNextUserResultPage) {
      yield* mapFetchNextUserResultPage();
    }
  }
}
