// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_for_title_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchForTitleInitiated extends SearchForTitleInitiated {
  @override
  final String title;

  factory _$SearchForTitleInitiated(
          [void updates(SearchForTitleInitiatedBuilder b)]) =>
      (new SearchForTitleInitiatedBuilder()..update(updates)).build();

  _$SearchForTitleInitiated._({this.title}) : super._() {
    if (title == null) {
      throw new BuiltValueNullFieldError('SearchForTitleInitiated', 'title');
    }
  }

  @override
  SearchForTitleInitiated rebuild(
          void updates(SearchForTitleInitiatedBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchForTitleInitiatedBuilder toBuilder() =>
      new SearchForTitleInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchForTitleInitiated && title == other.title;
  }

  @override
  int get hashCode {
    return $jf($jc(0, title.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchForTitleInitiated')
          ..add('title', title))
        .toString();
  }
}

class SearchForTitleInitiatedBuilder
    implements
        Builder<SearchForTitleInitiated, SearchForTitleInitiatedBuilder> {
  _$SearchForTitleInitiated _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  SearchForTitleInitiatedBuilder();

  SearchForTitleInitiatedBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchForTitleInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchForTitleInitiated;
  }

  @override
  void update(void updates(SearchForTitleInitiatedBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchForTitleInitiated build() {
    final _$result = _$v ?? new _$SearchForTitleInitiated._(title: title);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
