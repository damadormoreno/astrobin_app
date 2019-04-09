library search_for_title_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_for_title_event.g.dart';

abstract class SearchForTitleEvent {}

abstract class SearchForTitleInitiated extends SearchForTitleEvent
    implements Built<SearchForTitleInitiated, SearchForTitleInitiatedBuilder> {
  String get title;

  SearchForTitleInitiated._();

  factory SearchForTitleInitiated([updates(SearchForTitleInitiatedBuilder b)]) =
      _$SearchForTitleInitiated;
}

class FetchNextResultPage extends SearchForTitleEvent {}
