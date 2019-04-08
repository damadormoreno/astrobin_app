library meta;

import 'dart:convert';

import 'package:astrobin_app/model/serializer/serializers.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'meta.g.dart';

abstract class Meta implements Built<Meta, MetaBuilder> {
  String get next;

  Meta._();

  factory Meta([updates(MetaBuilder b)]) = _$Meta;

  String toJson() {
    return json.encode(serializers.serializeWith(Meta.serializer, this));
  }

  static Meta fromJson(String jsonString) {
    return serializers.deserializeWith(
        Meta.serializer, json.decode(jsonString));
  }

  static Serializer<Meta> get serializer => _$metaSerializer;
}
