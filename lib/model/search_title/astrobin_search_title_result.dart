library astrobin_search_title_result;

import 'dart:convert';

import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:astrobin_app/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:http/http.dart';

part 'astrobin_search_title_result.g.dart';

abstract class AstrobinSearchTitleResult
    implements
        Built<AstrobinSearchTitleResult, AstrobinSearchTitleResultBuilder> {
  Meta get meta;
  @nullable
  BuiltList<SearchTitleItem> get objects;

  AstrobinSearchTitleResult._();

  factory AstrobinSearchTitleResult(
          [updates(AstrobinSearchTitleResultBuilder b)]) =
      _$AstrobinSearchTitleResult;

  String toJson() {
    return json.encode(
        serializers.serializeWith(AstrobinSearchTitleResult.serializer, this));
  }

  static AstrobinSearchTitleResult fromJson(Response response) {
    return serializers.deserializeWith(
        AstrobinSearchTitleResult.serializer, json.decode(utf8.decode(response.bodyBytes)));
  }

  static Serializer<AstrobinSearchTitleResult> get serializer =>
      _$astrobinSearchTitleResultSerializer;
}
