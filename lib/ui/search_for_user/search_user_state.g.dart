// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_user_state.dart;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchUserState extends SearchUserState {
  @override
  final bool isLoading;
  @override
  final BuiltList<SearchTitleItem> searchResults;
  @override
  final String error;
  @override
  final bool hasReachedEndOfResults;

  factory _$SearchUserState([void Function(SearchUserStateBuilder) updates]) =>
      (new SearchUserStateBuilder()..update(updates)).build();

  _$SearchUserState._(
      {this.isLoading,
      this.searchResults,
      this.error,
      this.hasReachedEndOfResults})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SearchUserState', 'isLoading');
    }
    if (searchResults == null) {
      throw new BuiltValueNullFieldError('SearchUserState', 'searchResults');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SearchUserState', 'error');
    }
    if (hasReachedEndOfResults == null) {
      throw new BuiltValueNullFieldError(
          'SearchUserState', 'hasReachedEndOfResults');
    }
  }

  @override
  SearchUserState rebuild(void Function(SearchUserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchUserStateBuilder toBuilder() =>
      new SearchUserStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchUserState &&
        isLoading == other.isLoading &&
        searchResults == other.searchResults &&
        error == other.error &&
        hasReachedEndOfResults == other.hasReachedEndOfResults;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), searchResults.hashCode),
            error.hashCode),
        hasReachedEndOfResults.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SearchUserState')
          ..add('isLoading', isLoading)
          ..add('searchResults', searchResults)
          ..add('error', error)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class SearchUserStateBuilder
    implements Builder<SearchUserState, SearchUserStateBuilder> {
  _$SearchUserState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<SearchTitleItem> _searchResults;
  ListBuilder<SearchTitleItem> get searchResults =>
      _$this._searchResults ??= new ListBuilder<SearchTitleItem>();
  set searchResults(ListBuilder<SearchTitleItem> searchResults) =>
      _$this._searchResults = searchResults;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _hasReachedEndOfResults;
  bool get hasReachedEndOfResults => _$this._hasReachedEndOfResults;
  set hasReachedEndOfResults(bool hasReachedEndOfResults) =>
      _$this._hasReachedEndOfResults = hasReachedEndOfResults;

  SearchUserStateBuilder();

  SearchUserStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _searchResults = _$v.searchResults?.toBuilder();
      _error = _$v.error;
      _hasReachedEndOfResults = _$v.hasReachedEndOfResults;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SearchUserState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchUserState;
  }

  @override
  void update(void Function(SearchUserStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchUserState build() {
    _$SearchUserState _$result;
    try {
      _$result = _$v ??
          new _$SearchUserState._(
              isLoading: isLoading,
              searchResults: searchResults.build(),
              error: error,
              hasReachedEndOfResults: hasReachedEndOfResults);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'searchResults';
        searchResults.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SearchUserState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
