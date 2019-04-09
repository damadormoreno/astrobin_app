// GENERATED CODE - DO NOT MODIFY BY HAND

part of search_for_title_state.dart;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SearchForTitleState extends SearchForTitleState {
  @override
  final bool isLoading;
  @override
  final BuiltList<SearchTitleItem> searchResults;
  @override
  final String error;
  @override
  final bool hasReachedEndOfResults;

  factory _$SearchForTitleState([void updates(SearchForTitleStateBuilder b)]) =>
      (new SearchForTitleStateBuilder()..update(updates)).build();

  _$SearchForTitleState._(
      {this.isLoading,
      this.searchResults,
      this.error,
      this.hasReachedEndOfResults})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SearchForTitleState', 'isLoading');
    }
    if (searchResults == null) {
      throw new BuiltValueNullFieldError(
          'SearchForTitleState', 'searchResults');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SearchForTitleState', 'error');
    }
    if (hasReachedEndOfResults == null) {
      throw new BuiltValueNullFieldError(
          'SearchForTitleState', 'hasReachedEndOfResults');
    }
  }

  @override
  SearchForTitleState rebuild(void updates(SearchForTitleStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SearchForTitleStateBuilder toBuilder() =>
      new SearchForTitleStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SearchForTitleState &&
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
    return (newBuiltValueToStringHelper('SearchForTitleState')
          ..add('isLoading', isLoading)
          ..add('searchResults', searchResults)
          ..add('error', error)
          ..add('hasReachedEndOfResults', hasReachedEndOfResults))
        .toString();
  }
}

class SearchForTitleStateBuilder
    implements Builder<SearchForTitleState, SearchForTitleStateBuilder> {
  _$SearchForTitleState _$v;

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

  SearchForTitleStateBuilder();

  SearchForTitleStateBuilder get _$this {
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
  void replace(SearchForTitleState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SearchForTitleState;
  }

  @override
  void update(void updates(SearchForTitleStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SearchForTitleState build() {
    _$SearchForTitleState _$result;
    try {
      _$result = _$v ??
          new _$SearchForTitleState._(
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
            'SearchForTitleState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
