// GENERATED CODE - DO NOT MODIFY BY HAND

part of meta;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Meta> _$metaSerializer = new _$MetaSerializer();

class _$MetaSerializer implements StructuredSerializer<Meta> {
  @override
  final Iterable<Type> types = const [Meta, _$Meta];
  @override
  final String wireName = 'Meta';

  @override
  Iterable serialize(Serializers serializers, Meta object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.next != null) {
      result
        ..add('next')
        ..add(serializers.serialize(object.next,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Meta deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MetaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'next':
          result.next = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Meta extends Meta {
  @override
  final String next;

  factory _$Meta([void updates(MetaBuilder b)]) =>
      (new MetaBuilder()..update(updates)).build();

  _$Meta._({this.next}) : super._();

  @override
  Meta rebuild(void updates(MetaBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  MetaBuilder toBuilder() => new MetaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Meta && next == other.next;
  }

  @override
  int get hashCode {
    return $jf($jc(0, next.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Meta')..add('next', next)).toString();
  }
}

class MetaBuilder implements Builder<Meta, MetaBuilder> {
  _$Meta _$v;

  String _next;
  String get next => _$this._next;
  set next(String next) => _$this._next = next;

  MetaBuilder();

  MetaBuilder get _$this {
    if (_$v != null) {
      _next = _$v.next;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Meta other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Meta;
  }

  @override
  void update(void updates(MetaBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Meta build() {
    final _$result = _$v ?? new _$Meta._(next: next);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
