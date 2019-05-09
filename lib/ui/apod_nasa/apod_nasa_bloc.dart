import 'package:astrobin_app/model/apodItem.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:rxdart/rxdart.dart';

class ApodNasaBloc {
  final AstrobinRepository _astrobinRepository;
  final _apodFetcher = PublishSubject<ApodItem>();

  ApodNasaBloc(this._astrobinRepository);

  Observable<ApodItem> get apod => _apodFetcher.stream;

  getApodNasa() async {
    ApodItem itemModel = await _astrobinRepository.fetchApodNasa();
    _apodFetcher.sink.add(itemModel);
  }

  dispose() {
    _apodFetcher.close();
  }
}
