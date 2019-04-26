// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_user_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchUserInitiated extends SearchUserInitiated {
  @override
  final String user;

  factory _$SearchUserInitiated(
          [void Function(SearchUserInitiatedBuilder) updates]) =>
      (new SearchUserInitiatedBuilder()..update(updates)).build();

  _$SearchUserInitiated._({this.user}) : super._() {
    if (user == null) {
      throw new BuiltValueNullFieldError('SearchUserInitiated', 'user');
    }
  }

  @override
  SearchUserInitiated rebuild(
          void Function(SearchUserInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchUserInitiatedBuilder toBuilder() =>
      new SearchUserInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchUserInitiated && user == other.user;
  }

  @override
  int get hashCode {
    return $jf($jc(0, user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchUserInitiated')
          ..add('user', user))
        .toString();
  }
}

class SearchUserInitiatedBuilder
    implements Builder<SearchUserInitiated, SearchUserInitiatedBuilder> {
  _$SearchUserInitiated _$v;

  String _user;
  String get user => _$this._user;
  set user(String user) => _$this._user = user;

  SearchUserInitiatedBuilder();

  SearchUserInitiatedBuilder get _$this {
    if (_$v != null) {
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchUserInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchUserInitiated;
  }

  @override
  void update(void Function(SearchUserInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchUserInitiated build() {
    final _$result = _$v ?? new _$SearchUserInitiated._(user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
