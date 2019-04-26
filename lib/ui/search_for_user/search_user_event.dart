library search_user_event;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_user_event.g.dart';

abstract class SearchUserEvent {}

abstract class SearchUserInitiated extends SearchUserEvent
    implements Built<SearchUserInitiated, SearchUserInitiatedBuilder> {
  String get user;

  SearchUserInitiated._();

  factory SearchUserInitiated([updates(SearchUserInitiatedBuilder b)]) =
      _$SearchUserInitiated;
}

class FetchNextUserResultPage extends SearchUserEvent {}
