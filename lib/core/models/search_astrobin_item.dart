import 'astrobin_item.dart';

class SearchAstrobinItem {
  Meta _meta;
  List<AstrobinItem> _objects;

  SearchAstrobinItem({Meta meta, List<AstrobinItem> objects}) {
    this._meta = meta;
    this._objects = objects;
  }

  Meta get meta => _meta;
  set meta(Meta meta) => _meta = meta;
  List<AstrobinItem> get objects => _objects;
  set objects(List<AstrobinItem> objects) => _objects = objects;

  SearchAstrobinItem.fromJson(Map<String, dynamic> json) {
    _meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    if (json['objects'] != null) {
      _objects = new List<AstrobinItem>();
      json['objects'].forEach((v) {
        _objects.add(new AstrobinItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._meta != null) {
      data['meta'] = this._meta.toJson();
    }
    if (this._objects != null) {
      data['objects'] = this._objects.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meta {
  int _limit;
  String _next;
  int _offset;
  String _previous;
  int _totalCount;

  Meta({int limit, String next, int offset, String previous, int totalCount}) {
    this._limit = limit;
    this._next = next;
    this._offset = offset;
    this._previous = previous;
    this._totalCount = totalCount;
  }

  int get limit => _limit;
  set limit(int limit) => _limit = limit;
  String get next => _next;
  set next(String next) => _next = next;
  int get offset => _offset;
  set offset(int offset) => _offset = offset;
  String get previous => _previous;
  set previous(String previous) => _previous = previous;
  int get totalCount => _totalCount;
  set totalCount(int totalCount) => _totalCount = totalCount;

  Meta.fromJson(Map<String, dynamic> json) {
    _limit = json['limit'];
    _next = json['next'];
    _offset = json['offset'];
    _previous = json['previous'];
    _totalCount = json['total_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this._limit;
    data['next'] = this._next;
    data['offset'] = this._offset;
    data['previous'] = this._previous;
    data['total_count'] = this._totalCount;
    return data;
  }
}
