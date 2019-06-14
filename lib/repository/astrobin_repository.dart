import 'package:astrobin_app/model/apodItem.dart';
import 'package:astrobin_app/model/astrobin_item.dart';
import 'package:astrobin_app/model/iss_positioned.dart';
import 'package:astrobin_app/network/iss_data_source.dart';
import 'package:built_collection/built_collection.dart';
import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/network/astrobin_data_source.dart';

class AstrobinRepository {
  AstrobinDataSource _astrobinDataSource;
  IssDataSource _issDataSource;

  String _lastSearchQuery;
  String _lastSearchUserQuery;
  String _nextUrl;

  AstrobinRepository(this._astrobinDataSource, this._issDataSource);

  Future<AstrobinItem> fetchPod() => _astrobinDataSource.fetchPod();

  Future<ApodItem> fetchApodNasa() => _astrobinDataSource.fetchApodNasa();

  Future<IssPositioned> fetchIssPosition() => _issDataSource.fetchIssPosition();

  Future<BuiltList<SearchTitleItem>> searchForTitle(String query) async {
    final searchresult = await _astrobinDataSource.searchForTitle(title: query);
    _cacheValues(title: query, nextPageUrl: searchresult.meta.next);
    if (searchresult.objects.isEmpty) throw NoSearchTitleResultsException();
    return searchresult.objects;
  }

  Future<BuiltList<SearchTitleItem>> searchForUser(String query) async {
    final searchresultUser =
        await _astrobinDataSource.searchForUser(user: query);
    _cacheUserValues(user: query, nextPageUrl: searchresultUser.meta.next);
    if (searchresultUser.objects.isEmpty) throw NoSearchUserResultsException();
    return searchresultUser.objects;
  }

  void _cacheValues({String title, String nextPageUrl}) {
    _lastSearchQuery = title;
    _nextUrl = nextPageUrl;
  }

  void _cacheUserValues({String user, String nextPageUrl}) {
    _lastSearchUserQuery = user;
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

  Future<BuiltList<SearchTitleItem>> fetchNextUserResultPage() async {
    if (_lastSearchUserQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextUrl == null) {
      throw NoNextUrlException();
    }

    final nextPageSearchUserResult = await _astrobinDataSource.searchForUser(
        user: _lastSearchUserQuery, nextUrl: _nextUrl);

    _cacheUserValues(
        user: _lastSearchUserQuery,
        nextPageUrl: nextPageSearchUserResult.meta.next);

    return nextPageSearchUserResult.objects;
  }
}

class SearchNotInitiatedException implements Exception {
  final message = "Cannot get the next result page without searching first.";
}

class NoSearchTitleResultsException implements Exception {
  final message = "No results";
}

class NoSearchUserResultsException implements Exception {
  final message = "No results";
}

class NoNextUrlException implements Exception {
  final message = "No results";
}
