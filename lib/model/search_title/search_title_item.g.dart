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
  final String url_hd;
  @override
  final String url_real;
  @override
  final String url_regular;
  @override
  final String url_thumb;
  @override
  final String user;

  factory _$SearchTitleItem([void updates(SearchTitleItemBuilder b)]) =>
      (new SearchTitleItemBuilder()..update(updates)).build();

  _$SearchTitleItem._(
      {this.description,
      this.title,
      this.url_hd,
      this.url_real,
      this.url_regular,
      this.url_thumb,
      this.user})
      : super._() {
    if (description == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'description');
    }
    if (title == null) {
      throw new BuiltValueNullFieldError('SearchTitleItem', 'title');
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
  SearchTitleItem rebuild(void updates(SearchTitleItemBuilder b)) =>
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
        url_hd == other.url_hd &&
        url_real == other.url_real &&
        url_regular == other.url_regular &&
        url_thumb == other.url_thumb &&
        user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, description.hashCode), title.hashCode),
                        url_hd.hashCode),
                    url_real.hashCode),
                url_regular.hashCode),
            url_thumb.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchTitleItem')
          ..add('description', description)
          ..add('title', title)
          ..add('url_hd', url_hd)
          ..add('url_real', url_real)
          ..add('url_regular', url_regular)
          ..add('url_thumb', url_thumb)
          ..add('user', user))
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

  SearchTitleItemBuilder();

  SearchTitleItemBuilder get _$this {
    if (_$v != null) {
      _description = _$v.description;
      _title = _$v.title;
      _url_hd = _$v.url_hd;
      _url_real = _$v.url_real;
      _url_regular = _$v.url_regular;
      _url_thumb = _$v.url_thumb;
      _user = _$v.user;
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
  void update(void updates(SearchTitleItemBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchTitleItem build() {
    final _$result = _$v ??
        new _$SearchTitleItem._(
            description: description,
            title: title,
            url_hd: url_hd,
            url_real: url_real,
            url_regular: url_regular,
            url_thumb: url_thumb,
            user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
