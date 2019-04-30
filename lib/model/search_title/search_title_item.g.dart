// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_title_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SearchTitleItem> _$searchTitleItemSerializer =
    new _$SearchTitleItemSerializer();

class _$SearchTitleItemSerializer
    implements StructuredSerializer<SearchTitleItem> {
  @override
  final Iterable<Type> types = const [SearchTitleItem, _$SearchTitleItem];
  @override
  final String wireName = 'SearchTitleItem';

  @override
  Iterable serialize(Serializers serializers, SearchTitleItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'description',
      serializers.serialize(object.description,
          specifiedType: const FullType(String)),
      'title',
      serializers.serialize(object.title,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'imaging_cameras',
      serializers.serialize(object.imaging_cameras,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'imaging_telescopes',
      serializers.serialize(object.imaging_telescopes,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'locations',
      serializers.serialize(object.locations,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'subjects',
      serializers.serialize(object.subjects,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'revisions',
      serializers.serialize(object.revisions,
          specifiedType:
              const FullType(BuiltList, const [const FullType(String)])),
      'updated',
      serializers.serialize(object.updated,
          specifiedType: const FullType(String)),
      'uploaded',
      serializers.serialize(object.uploaded,
          specifiedType: const FullType(String)),
      'url_hd',
      serializers.serialize(object.url_hd,
          specifiedType: const FullType(String)),
      'url_real',
      serializers.serialize(object.url_real,
          specifiedType: const FullType(String)),
      'url_regular',
      serializers.serialize(object.url_regular,
          specifiedType: const FullType(String)),
      'url_thumb',
      serializers.serialize(object.url_thumb,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(String)),
    ];
    if (object.isFavorite != null) {
      result
        ..add('isFavorite')
        ..add(serializers.serialize(object.isFavorite,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  SearchTitleItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SearchTitleItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'imaging_cameras':
          result.imaging_cameras.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'imaging_telescopes':
          result.imaging_telescopes.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'locations':
          result.locations.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'subjects':
          result.subjects.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'revisions':
          result.revisions.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList);
          break;
        case 'updated':
          result.updated = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'uploaded':
          result.uploaded = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url_hd':
          result.url_hd = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url_real':
          result.url_real = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url_regular':
          result.url_regular = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url_thumb':
          result.url_thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isFavorite':
          result.isFavorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$SearchTitleItem extends SearchTitleItem {
  @override
  final String description;
  @override
  final String title;
  @override
  final int id;
  @override
  final BuiltList<String> imaging_cameras;
  @override
  final BuiltList<String> imaging_telescopes;
  @override
  final BuiltList<String> locations;
  @override
  final BuiltList<String> subjects;
  @override
  final BuiltList<String> revisions;
  @override
  final String updated;
  @override
  final String uploaded;
  @override
  final String url_hd;
  @override
  final String url_real;
  @override
  final String url_regular;
  @override
  final String url_thumb;
  @override
  final String user;
  @override
  final bool isFavorite;

  factory _$SearchTitleItem([void Function(SearchTitleItemBuilder) updates]) =>
      (new SearchTitleItemBuilder()..update(updates)).build();

  _$SearchTitleItem._(
      {this.description,
      this.title,
      this.id,
      this.imaging_cameras,
      this.imaging_telescopes,
      this.locations,
      this.subjects,
      this.revisions,
      this.updated,
      this.uploaded,
      this.url_hd,
      this.url_real,
      this.url_regular,
      this.url_thumb,
      this.user,
      this.isFavorite})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'description');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'title');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'id');
    }
    if (imaging_cameras == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'imaging_cameras');
    }
    if (imaging_telescopes == null) {
      throw new BuiltValueNullFieldError(
          'SearchTitleItem', 'imaging_telescopes');
    }
    if (locations == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'locations');
    }
    if (subjects == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'subjects');
    }
    if (revisions == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'revisions');
    }
    if (updated == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'updated');
    }
    if (uploaded == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'uploaded');
    }
    if (url_hd == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'url_hd');
    }
    if (url_real == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'url_real');
    }
    if (url_regular == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'url_regular');
    }
    if (url_thumb == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'url_thumb');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'user');
    }
  }

  @override
  SearchTitleItem rebuild(void Function(SearchTitleItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchTitleItemBuilder toBuilder() =>
      new SearchTitleItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchTitleItem &&
        description == other.description &&
        title == other.title &&
        id == other.id &&
        imaging_cameras == other.imaging_cameras &&
        imaging_telescopes == other.imaging_telescopes &&
        locations == other.locations &&
        subjects == other.subjects &&
        revisions == other.revisions &&
        updated == other.updated &&
        uploaded == other.uploaded &&
        url_hd == other.url_hd &&
        url_real == other.url_real &&
        url_regular == other.url_regular &&
        url_thumb == other.url_thumb &&
        user == other.user &&
        isFavorite == other.isFavorite;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    0,
                                                                    description
                                                                        .hashCode),
                                                                title.hashCode),
                                                            id.hashCode),
                                                        imaging_cameras
                                                            .hashCode),
                                                    imaging_telescopes
                                                        .hashCode),
                                                locations.hashCode),
                                            subjects.hashCode),
                                        revisions.hashCode),
                                    updated.hashCode),
                                uploaded.hashCode),
                            url_hd.hashCode),
                        url_real.hashCode),
                    url_regular.hashCode),
                url_thumb.hashCode),
            user.hashCode),
        isFavorite.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchTitleItem')
          ..add('description', description)
          ..add('title', title)
          ..add('id', id)
          ..add('imaging_cameras', imaging_cameras)
          ..add('imaging_telescopes', imaging_telescopes)
          ..add('locations', locations)
          ..add('subjects', subjects)
          ..add('revisions', revisions)
          ..add('updated', updated)
          ..add('uploaded', uploaded)
          ..add('url_hd', url_hd)
          ..add('url_real', url_real)
          ..add('url_regular', url_regular)
          ..add('url_thumb', url_thumb)
          ..add('user', user)
          ..add('isFavorite', isFavorite))
        .toString();
  }
}

class SearchTitleItemBuilder
    implements Builder<SearchTitleItem, SearchTitleItemBuilder> {
  _$SearchTitleItem _$v;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  ListBuilder<String> _imaging_cameras;
  ListBuilder<String> get imaging_cameras =>
      _$this._imaging_cameras ??= new ListBuilder<String>();
  set imaging_cameras(ListBuilder<String> imaging_cameras) =>
      _$this._imaging_cameras = imaging_cameras;

  ListBuilder<String> _imaging_telescopes;
  ListBuilder<String> get imaging_telescopes =>
      _$this._imaging_telescopes ??= new ListBuilder<String>();
  set imaging_telescopes(ListBuilder<String> imaging_telescopes) =>
      _$this._imaging_telescopes = imaging_telescopes;

  ListBuilder<String> _locations;
  ListBuilder<String> get locations =>
      _$this._locations ??= new ListBuilder<String>();
  set locations(ListBuilder<String> locations) => _$this._locations = locations;

  ListBuilder<String> _subjects;
  ListBuilder<String> get subjects =>
      _$this._subjects ??= new ListBuilder<String>();
  set subjects(ListBuilder<String> subjects) => _$this._subjects = subjects;

  ListBuilder<String> _revisions;
  ListBuilder<String> get revisions =>
      _$this._revisions ??= new ListBuilder<String>();
  set revisions(ListBuilder<String> revisions) => _$this._revisions = revisions;

  String _updated;
  String get updated => _$this._updated;
  set updated(String updated) => _$this._updated = updated;

  String _uploaded;
  String get uploaded => _$this._uploaded;
  set uploaded(String uploaded) => _$this._uploaded = uploaded;

  String _url_hd;
  String get url_hd => _$this._url_hd;
  set url_hd(String url_hd) => _$this._url_hd = url_hd;

  String _url_real;
  String get url_real => _$this._url_real;
  set url_real(String url_real) => _$this._url_real = url_real;

  String _url_regular;
  String get url_regular => _$this._url_regular;
  set url_regular(String url_regular) => _$this._url_regular = url_regular;

  String _url_thumb;
  String get url_thumb => _$this._url_thumb;
  set url_thumb(String url_thumb) => _$this._url_thumb = url_thumb;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  bool _isFavorite;
  bool get isFavorite => _$this._isFavorite;
  set isFavorite(bool isFavorite) => _$this._isFavorite = isFavorite;

  SearchTitleItemBuilder();

  SearchTitleItemBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _title = _$v.title;
      _id = _$v.id;
      _imaging_cameras = _$v.imaging_cameras?.toBuilder();
      _imaging_telescopes = _$v.imaging_telescopes?.toBuilder();
      _locations = _$v.locations?.toBuilder();
      _subjects = _$v.subjects?.toBuilder();
      _revisions = _$v.revisions?.toBuilder();
      _updated = _$v.updated;
      _uploaded = _$v.uploaded;
      _url_hd = _$v.url_hd;
      _url_real = _$v.url_real;
      _url_regular = _$v.url_regular;
      _url_thumb = _$v.url_thumb;
      _user = _$v.user;
      _isFavorite = _$v.isFavorite;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchTitleItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchTitleItem;
  }

  @override
  void update(void Function(SearchTitleItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchTitleItem build() {
    _$SearchTitleItem _$result;
    try {
      _$result = _$v ??
          new _$SearchTitleItem._(
              description: description,
              title: title,
              id: id,
              imaging_cameras: imaging_cameras.build(),
              imaging_telescopes: imaging_telescopes.build(),
              locations: locations.build(),
              subjects: subjects.build(),
              revisions: revisions.build(),
              updated: updated,
              uploaded: uploaded,
              url_hd: url_hd,
              url_real: url_real,
              url_regular: url_regular,
              url_thumb: url_thumb,
              user: user,
              isFavorite: isFavorite);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imaging_cameras';
        imaging_cameras.build();
        _$failedField = 'imaging_telescopes';
        imaging_telescopes.build();
        _$failedField = 'locations';
        locations.build();
        _$failedField = 'subjects';
        subjects.build();
        _$failedField = 'revisions';
        revisions.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchTitleItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
