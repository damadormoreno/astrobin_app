library serializers;

import 'dart:convert';

import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

part 'serializers.g.dart';

@SerializersFor(const [
  AstrobinSearchTitleResult,
  Meta,
  SearchTitleItem,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
