library search_for_title_state.dart;

import 'dart:convert';

import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_for_title_state.g.dart';

abstract class SearchForTitleState
    implements Built<SearchForTitleState, SearchForTitleStateBuilder> {
  bool get isLoading;
  BuiltList<SearchTitleItem> get searchResults;
  String get error;

  bool get hasReachedEndOfResults;

  bool get isInitial => !isLoading && searchResults.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && searchResults.isNotEmpty && error == '';

  SearchForTitleState._();

  factory SearchForTitleState([updates(SearchForTitleStateBuilder b)]) =
      _$SearchForTitleState;

  factory SearchForTitleState.initial() {
    return SearchForTitleState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchForTitleState.loading() {
    return SearchForTitleState((b) => b
      ..isLoading = true
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = ''
      ..hasReachedEndOfResults = false);
  }

  factory SearchForTitleState.failure(String error) {
    return SearchForTitleState((b) => b
      ..isLoading = false
      ..searchResults.replace(BuiltList<SearchTitleItem>())
      ..error = error
      ..hasReachedEndOfResults = false);
  }

  factory SearchForTitleState.success(BuiltList<SearchTitleItem> resultList) {
    return SearchForTitleState((b) => b
      ..isLoading = false
      ..searchResults.replace(resultList)
      ..error = ''
      ..hasReachedEndOfResults = false);
  }
}
