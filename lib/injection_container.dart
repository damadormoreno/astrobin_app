import 'package:astrobin_app/network/astrobin_data_source.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:astrobin_app/ui/search_for_title/search_title_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => AstrobinDataSource(c.resolve()))
    ..registerFactory((c) => AstrobinRepository(c.resolve()))
    ..registerFactory((c) => SearchForTitleBloc(c.resolve()));
}
