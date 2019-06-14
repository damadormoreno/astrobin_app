import 'package:astrobin_app/model/iss_positioned.dart';
import 'package:astrobin_app/repository/astrobin_repository.dart';
import 'package:rxdart/rxdart.dart';

class IssPositionBloc {
  final AstrobinRepository _astrobinRepository;
  final _issPositioned = PublishSubject<IssPositioned>();

  IssPositionBloc(this._astrobinRepository);

  Observable<IssPositioned> get issPosition => _issPositioned.stream;

  getIssPosition() async {
    IssPositioned itemModel = await _astrobinRepository.fetchIssPosition();
    _issPositioned.sink.add(itemModel);
  }

  dispose() {
    _issPositioned.close();
  }
}
