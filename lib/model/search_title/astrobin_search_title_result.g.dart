// GENERATED CODE - DO NOT MODIFY BY HAND

part of astrobin_search_title_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AstrobinSearchTitleResult> _$astrobinSearchTitleResultSerializer =
    new _$AstrobinSearchTitleResultSerializer();

class _$AstrobinSearchTitleResultSerializer
    implements StructuredSerializer<AstrobinSearchTitleResult> {
  @override
  final Iterable<Type> types = const [
    AstrobinSearchTitleResult,
    _$AstrobinSearchTitleResult
  ];
  @override
  final String wireName = 'AstrobinSearchTitleResult';

  @override
  Iterable serialize(Serializers serializers, AstrobinSearchTitleResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'meta',
      serializers.serialize(object.meta, specifiedType: const FullType(Meta)),
      'objects',
      serializers.serialize(object.objects,
          specifiedType: const FullType(
              BuiltList, const [const FullType(SearchTitleItem)])),
    ];

    return result;
  }

  @override
  AstrobinSearchTitleResult deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AstrobinSearchTitleResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'meta':
          result.meta.replace(serializers.deserialize(value,
              specifiedType: const FullType(Meta)) as Meta);
          break;
        case 'objects':
          result.objects.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(SearchTitleItem)]))
              as BuiltList);
          break;
      }
    }

    return result.build();
  }
}

class _$AstrobinSearchTitleResult extends AstrobinSearchTitleResult {
  @override
  final Meta meta;
  @override
  final BuiltList<SearchTitleItem> objects;

  factory _$AstrobinSearchTitleResult(
          [void updates(AstrobinSearchTitleResultBuilder b)]) =>
      (new AstrobinSearchTitleResultBuilder()..update(updates)).build();

  _$AstrobinSearchTitleResult._({this.meta, this.objects}) : super._() {
    if (meta == null) {
      throw new BuiltValueNullFieldError('AstrobinSearchTitleResult', 'meta');
    }
    if (objects == null) {
      throw new BuiltValueNullFieldError(
          'AstrobinSearchTitleResult', 'objects');
    }
  }

  @override
  AstrobinSearchTitleResult rebuild(
          void updates(AstrobinSearchTitleResultBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AstrobinSearchTitleResultBuilder toBuilder() =>
      new AstrobinSearchTitleResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AstrobinSearchTitleResult &&
        meta == other.meta &&
        objects == other.objects;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, meta.hashCode), objects.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AstrobinSearchTitleResult')
          ..add('meta', meta)
          ..add('objects', objects))
        .toString();
  }
}

class AstrobinSearchTitleResultBuilder
    implements
        Builder<AstrobinSearchTitleResult, AstrobinSearchTitleResultBuilder> {
  _$AstrobinSearchTitleResult _$v;

  MetaBuilder _meta;
  MetaBuilder get meta => _$this._meta ??= new MetaBuilder();
  set meta(MetaBuilder meta) => _$this._meta = meta;

  ListBuilder<SearchTitleItem> _objects;
  ListBuilder<SearchTitleItem> get objects =>
      _$this._objects ??= new ListBuilder<SearchTitleItem>();
  set objects(ListBuilder<SearchTitleItem> objects) =>
      _$this._objects = objects;

  AstrobinSearchTitleResultBuilder();

  AstrobinSearchTitleResultBuilder get _$this {
    if (_$v != null) {
      _meta = _$v.meta?.toBuilder();
      _objects = _$v.objects?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AstrobinSearchTitleResult other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AstrobinSearchTitleResult;
  }

  @override
  void update(void updates(AstrobinSearchTitleResultBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AstrobinSearchTitleResult build() {
    _$AstrobinSearchTitleResult _$result;
    try {
      _$result = _$v ??
          new _$AstrobinSearchTitleResult._(
              meta: meta.build(), objects: objects.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'meta';
        meta.build();
        _$failedField = 'objects';
        objects.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AstrobinSearchTitleResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
