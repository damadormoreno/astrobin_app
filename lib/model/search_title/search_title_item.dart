library search_title_item;

import 'dart:convert';

import 'package:astrobin_app/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'search_title_item.g.dart';

abstract class SearchTitleItem
    implements Built<SearchTitleItem, SearchTitleItemBuilder> {
  String get description;
  String get title;
  String get url_hd;
  String get url_real;
  String get url_regular;
  String get url_thumb;
  String get user;

  SearchTitleItem._();

  factory SearchTitleItem([updates(SearchTitleItemBuilder b)]) =
      _$SearchTitleItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(SearchTitleItem.serializer, this));
  }

  static SearchTitleItem fromJson(String jsonString) {
    return serializers.deserializeWith(
        SearchTitleItem.serializer, json.decode(jsonString));
  }

  static Serializer<SearchTitleItem> get serializer =>
      _$searchTitleItemSerializer;
}
