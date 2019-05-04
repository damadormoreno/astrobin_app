import 'package:astrobin_app/model/astrobin_item.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:rxdart/rxdart.dart';

class PictureOfDayBloc {
  final AstrobinRepository _astrobinRepository;
  final _moviesFetcher = PublishSubject<AstrobinItem>();

  PictureOfDayBloc(this._astrobinRepository);

  Observable<AstrobinItem> get pod => _moviesFetcher.stream;

  getPod() async {
    AstrobinItem itemModel = await _astrobinRepository.fetchPod();
    _moviesFetcher.sink.add(itemModel);
  }

  dispose() {
    _moviesFetcher.close();
  }
}
