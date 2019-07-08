import 'package:astrobin_app/core/datasources/local/apod_dao.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';
import 'package:astrobin_app/core/models/apodItem.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/core/models/iss_positioned.dart';
import 'package:astrobin_app/core/datasources/services/iss_data_source.dart';
import 'package:astrobin_app/core/datasources/services/astrobin_data_source.dart';
import 'package:intl/intl.dart';

class AstrobinRepository {
  AstrobinDataSource _astrobinDataSource;
  IssDataSource _issDataSource;
  final apodDao = ApodDao();

  String _lastSearchQuery;
  String _lastSearchUserQuery;
  String _nextUrl;

  AstrobinRepository(this._astrobinDataSource, this._issDataSource);

  Future<AstrobinItem> fetchPod() => _astrobinDataSource.fetchPod();

  Future<ApodItem> fetchApodNasa() async {
    var now = DateTime.now();
    var formater = new DateFormat("yyyy-MM-dd");

    ApodItem apodItem = await apodDao.getApod(formater.format(now));
    if (apodItem == null) {
      apodItem = await _astrobinDataSource.fetchApodNasa();
      apodDao.insert(apodItem);
    }
    return apodItem;
  }

  Future<IssPositioned> fetchIssPosition() => _issDataSource.fetchIssPosition();

  Future<List<AstrobinItem>> searchForTitleRefactor(String query) async {
    final searchresult =
        await _astrobinDataSource.searchForTitleRefactor(title: query);
    _cacheValues(title: query, nextPageUrl: searchresult.meta.next);
    if (searchresult.objects.isEmpty) throw NoSearchTitleResultsException();
    return searchresult.objects;
  }

  Future<List<AstrobinItem>> searchForUserRefactor(String query) async {
    final searchresultUser =
        await _astrobinDataSource.searchForUserRefactor(user: query);
    _cacheUserValues(user: query, nextPageUrl: searchresultUser.meta.next);
    if (searchresultUser.objects.isEmpty) throw NoSearchTitleResultsException();
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

  Future<List<AstrobinItem>> fetchNextResultPageRefactor() async {
    if (_lastSearchQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextUrl == null) {
      throw NoNextUrlException();
    }

    final nextPageSearchResult = await _astrobinDataSource
        .searchForTitleRefactor(title: _lastSearchQuery, nextUrl: _nextUrl);

    _cacheValues(
        title: _lastSearchQuery, nextPageUrl: nextPageSearchResult.meta.next);

    return nextPageSearchResult.objects;
  }

  Future<List<AstrobinItem>> fetchNextResultPageUserRefactor() async {
    if (_lastSearchUserQuery == null) {
      throw SearchNotInitiatedException();
    }

    if (_nextUrl == null) {
      throw NoNextUrlException();
    }

    final nextPageSearchResult = await _astrobinDataSource
        .searchForUserRefactor(user: _lastSearchUserQuery, nextUrl: _nextUrl);

    _cacheUserValues(
        user: _lastSearchUserQuery,
        nextPageUrl: nextPageSearchResult.meta.next);

    return nextPageSearchResult.objects;
  }
}
