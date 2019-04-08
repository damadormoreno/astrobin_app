import 'package:built_collection/built_collection.dart';
import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/network/astrobin_data_source.dart';

class AstrobinRepository {
  AstrobinDataSource _astrobinDataSource;

  String _lastSearchQuery;
  String _nextUrl;

  AstrobinRepository(this._astrobinDataSource);

  Future<BuiltList<SearchTitleItem>> searchVideos(String query) async {
    final searchresult = await _astrobinDataSource.searchForTitle(title: query);
    _cacheValues(title: query, nextPageUrl: searchresult.meta.next);
    if (searchresult.objects.isEmpty) throw NoSearchTitleResultsException();
    return searchresult.objects;
  }

  void _cacheValues({String title, String nextPageUrl}) {
    _lastSearchQuery = title;
    _nextUrl = nextPageUrl;
  }

  Future<BuiltList<SearchTitleItem>> fetchNextResultPage() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextUrl == null) {
      throw NoNextUrlException();
    }

    final nextPageSearchResult = await _astrobinDataSource.searchForTitle(
        title: _lastSearchQuery, nextUrl: _nextUrl);

    _cacheValues(
        title: _lastSearchQuery, nextPageUrl: nextPageSearchResult.meta.next);

    return nextPageSearchResult.objects;
  }
}

class SearchNotInitiatedException implements Exception {
  final message = "Cannot get the next result page without searching first.";
}

class NoSearchTitleResultsException implements Exception {
  final message = "No results";
}

class NoNextUrlException implements Exception {
  final message = "No results";
}
