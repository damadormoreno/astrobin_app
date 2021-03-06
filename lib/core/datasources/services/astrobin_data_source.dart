import 'dart:convert';
import 'dart:async';
import 'package:astrobin_app/core/exceptions/astrobin_search_error.dart';
import 'package:astrobin_app/core/exceptions/exceptions.dart';
import 'package:astrobin_app/core/models/apodItem.dart';
import 'package:astrobin_app/core/models/astrobin_item.dart';
import 'package:astrobin_app/core/models/item_pod.dart';
import 'package:astrobin_app/core/models/search_astrobin_item.dart';
import 'package:http/http.dart' as http;
import 'package:astrobin_app/core/datasources/services/api_key.dart';

const int LIMIT_RESULTS = 5;

class AstrobinDataSource {
  final http.Client client;

  final String _baseUrl = "https://www.astrobin.com";
  final String _baseUrlPod =
      "https://www.astrobin.com/api/v1/imageoftheday/?format=json&limit=1&api_key=$API_KEY&api_secret=$API_SECRET";
  final String _searchBaseUrl =
      'https://www.astrobin.com/api/v1/image/?format=json&limit=$LIMIT_RESULTS&api_key=$API_KEY&api_secret=$API_SECRET';

  AstrobinDataSource(this.client);

  Future<SearchAstrobinItem> searchForTitleRefactor({
    String title,
    String nextUrl = "",
  }) async {
    String urlRaw = "";
    if (nextUrl.isEmpty) {
      urlRaw = _searchBaseUrl + '&title__icontains=$title';
    } else {
      urlRaw = _baseUrl + nextUrl;
    }
    final urlEncoded = Uri.encodeFull(urlRaw);
    final response = await client.get(urlEncoded).timeout(Duration(seconds: 5));

    if (response.statusCode == 200) {
      return SearchAstrobinItem.fromJson(json.decode(response.body));
    } else {
      throw AstrobinSearchError(
          "Error en la búsqueda." /* json.decode(response.body) */);
    }
  }

  Future<SearchAstrobinItem> searchForUserRefactor({
    String user,
    String nextUrl = "",
  }) async {
    String urlRaw = "";
    if (nextUrl.isEmpty) {
      urlRaw = _searchBaseUrl + '&user=$user';
    } else {
      urlRaw = _baseUrl + nextUrl;
    }
    final urlEncoded = Uri.encodeFull(urlRaw);
    try {
      final response =
          await client.get(urlEncoded).timeout(Duration(seconds: 5));
      if (response.statusCode == 200) {
        return SearchAstrobinItem.fromJson(json.decode(response.body));
      } else {
        throw AstrobinSearchError(
            "Error en la búsqueda." /* json.decode(response.body) */);
      }
    } catch (exception) {
      throw AstrobinSearchError(
          "Error en la búsqueda." /* json.decode(response.body) */);
    }
  }

  Future<AstrobinItem> fetchPod() async {
    final response =
        await client.get(_baseUrlPod).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var itempod = ItemPod.fromJson(json.decode(response.body));
      return fetchPodById(itempod.objects[0].image);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Picture of day');
    }
  }

  Future<AstrobinItem> fetchPodById(String id) async {
    final response = await client
        .get(_baseUrl +
            id +
            "/?format=json&limit=1&api_key=$API_KEY&api_secret=$API_SECRET")
        .timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return AstrobinItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load Picture of day');
    }
  }

  Future<ApodItem> fetchApodNasa() async {
    final response = await client
        .get("https://api.nasa.gov/planetary/apod?api_key=$API_APOD_NASA");
    //VIDEO APOD
    /*final response = await client.get(
        "https://api.nasa.gov/planetary/apod?api_key=$API_APOD_NASA&date=2018-12-23&hd=true");*/
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ApodItem.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw ServiceError();
    }
  }
}
