import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:astrobin_app/model/iss_positioned.dart';

class IssDataSource {
  final http.Client client;
  final String _baseUrl = "http://api.open-notify.org/iss-now.json";

  IssDataSource(this.client);

  Future<IssPositioned> fetchIssPosition() async {
    final response = await client.get(_baseUrl).timeout(Duration(seconds: 5));
    if (response.statusCode == 200) {
      return IssPositioned.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to load Iss Position");
    }
  }
}
