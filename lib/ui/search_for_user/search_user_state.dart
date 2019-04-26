library search_user_state.dart;

import 'dart:convert';

import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_user_state.g.dart';

abstract class SearchUserState
    implements Built<SearchUserState, SearchUserStateBuilder> {
  bool get isLoading;
  BuiltList<SearchTitleItem> get searchResults;
  String get error;

  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && searchResults.isNotEmpty && error == '';

  SearchUserState._();

  factory SearchUserState([updates(SearchUserStateBuilder b)]) =
      _$SearchUserState;

  factory SearchUserState.initial() {
    return SearchUserState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.loading() {
    return SearchUserState((b) => b
      ..isLoading = true
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.failure(String error) {
    return SearchUserState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = error
      ..hasReachedEndOfResults = false);
  }

  factory SearchUserState.success(BuiltList<SearchTitleItem> resultList) {
    return SearchUserState((b) => b
      ..isLoading = false
      ..searchResults.replace(resultList)
      ..error = ''
      ..hasReachedEndOfResults = false);
  }
}
