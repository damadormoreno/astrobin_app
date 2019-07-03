import 'package:astrobin_app/core/datasources/services/astrobin_data_source.dart';
import 'package:astrobin_app/core/datasources/services/iss_data_source.dart';
import 'package:astrobin_app/core/repositories/astrobin_repository.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

import 'core/viewmodels/apod_viewmodel.dart';
import 'core/viewmodels/iss_viewmodel.dart';
import 'core/viewmodels/pod_viewmodel.dart';
import 'core/viewmodels/search_title_viewmodel.dart';
import 'core/viewmodels/search_user_viewmodel.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => AstrobinDataSource(c.resolve()))
    ..registerFactory((c) => IssDataSource(c.resolve()))
    ..registerFactory((c) => AstrobinRepository(c.resolve(), c.resolve()))
    ..registerFactory((c) => IssViewModel(c.resolve()))
    ..registerFactory((c) => PodViewModel(c.resolve()))
    ..registerFactory((c) => SearchTitleViewModel(c.resolve()))
    ..registerFactory((c) => SearchUserViewModel(c.resolve()))
    ..registerFactory((c) => ApodViewModel(c.resolve()));
}
