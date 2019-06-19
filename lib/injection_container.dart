import 'package:astrobin_app/core_refactor/datasources/services/astrobin_data_source.dart';
import 'package:astrobin_app/core_refactor/datasources/services/iss_data_source.dart';
import 'package:astrobin_app/core_refactor/repositories/astrobin_repository.dart';
import 'package:astrobin_app/ui/search_for_title/search_title_bloc.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

import 'core_refactor/viewmodels/apod_viewmodel.dart';
import 'core_refactor/viewmodels/iss_viewmodel.dart';
import 'core_refactor/viewmodels/pod_viewmodel.dart';

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => AstrobinDataSource(c.resolve()))
    ..registerFactory((c) => IssDataSource(c.resolve()))
    ..registerFactory((c) => AstrobinRepository(c.resolve(), c.resolve()))
    ..registerFactory((c) => SearchForTitleBloc(c.resolve()))
    ..registerFactory((c) => SearchUserBloc(c.resolve()))
    ..registerFactory((c) => IssViewModel(c.resolve()))
    ..registerFactory((c) => PodViewModel(c.resolve()))
    ..registerFactory((c) => ApodViewModel(c.resolve()));
}
