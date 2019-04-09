import 'dart:convert';

import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:http/http.dart' as http;
import 'api_key.dart';

const int LIMIT_RESULTS = 5;

class AstrobinDataSource {
  final http.Client client;

  final String _baseUrl = "https://www.astrobin.com";
  final String _searchBaseUrl =
      'https://www.astrobin.com/api/v1/image/?format=json&limit=$LIMIT_RESULTS&api_key=$API_KEY&api_secret=$API_SECRET';

  AstrobinDataSource(this.client);

  Future<AstrobinSearchTitleResult> searchForTitle({
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
    final response = await client.get(urlEncoded);

    if (response.statusCode == 200) {
      return AstrobinSearchTitleResult.fromJson(response.body);
    } else {
      throw AstrobinSearchError(
          "Error en la búsqueda." /* json.decode(response.body) */);
    }
  }
}
