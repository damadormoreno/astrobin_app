import 'package:astrobin_app/network/astrobin_data_source.dart';
import 'package:astrobin_app/network/iss_data_source.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:astrobin_app/ui/apod_nasa/apod_nasa_bloc.dart';
import 'package:astrobin_app/ui/iss/iss_position_bloc.dart';
import 'package:astrobin_app/ui/picture_of_day/picture_of_day_bloc.dart';
import 'package:astrobin_app/ui/search_for_title/search_title_bloc.dart';
import 'package:astrobin_app/ui/search_for_user/search_user_bloc.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:http/http.dart' as http;

void initKiwi() {
  kiwi.Container()
    ..registerInstance(http.Client())
    ..registerFactory((c) => AstrobinDataSource(c.resolve()))
    ..registerFactory((c) => IssDataSource(c.resolve()))
    ..registerFactory((c) => AstrobinRepository(c.resolve(), c.resolve()))
    ..registerFactory((c) => SearchForTitleBloc(c.resolve()))
    ..registerFactory((c) => SearchUserBloc(c.resolve()))
    ..registerFactory((c) => PictureOfDayBloc(c.resolve()))
    ..registerFactory((c) => IssPositionBloc(c.resolve()))
    ..registerFactory((c) => ApodNasaBloc(c.resolve()));
}
