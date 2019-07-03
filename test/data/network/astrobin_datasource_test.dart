import 'package:astrobin_app/core/datasources/services/astrobin_data_source.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';

class MockClient extends Mock implements http.Client {}

/*void main() {
  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  */ /*String json =
      "{\r\n\"meta\": {\r\n\"limit\": 3,\r\n\"next\": \"\/api\/v1\/image\/?format=json&api_secret=52d63d4586ce74efe2b5e29f2073951983ca1907&title__icontains=andromeda&limit=3&offset=3&api_key=60a5c503ba23143a388de773356f372fe40f4fe4\",\r\n        \"offset\": 0,\r\n        \"previous\": null,\r\n        \"total_count\": 3568\r\n    },\r\n    \"objects\": [\r\n        {\r\n            \"animated\": false,\r\n            \"dec\": \"41.188\",\r\n            \"description\": \"\",\r\n            \"h\": 2954,\r\n            \"id\": 399902,\r\n            \"imaging_cameras\": [\r\n                \"Sony A7III\"\r\n            ],\r\n            \"imaging_telescopes\": [\r\n                \"Imagestar 71mm f\/4.9 APO\"\r\n            ],\r\n            \"is_final\": true,\r\n            \"is_solved\": true,\r\n            \"license\": 0,\r\n            \"link\": \"\",\r\n            \"link_to_fits\": \"\",\r\n            \"locations\": [\r\n                \"\/api\/v1\/location\/2809996\/\"\r\n            ],\r\n            \"orientation\": \"63.960\",\r\n            \"pixscale\": \"3.548\",\r\n            \"published\": \"2019-04-08T07:48:00.479204\",\r\n            \"ra\": \"10.726\",\r\n            \"radius\": \"2.737\",\r\n            \"resource_uri\": \"\/api\/v1\/image\/399902\/\",\r\n            \"revisions\": [],\r\n            \"subjects\": [\r\n                \"M 31\",\r\n                \" Great Nebula in Andromeda\",\r\n                \" NGC 224\",\r\n                \" M 32\",\r\n                \" NGC 221\",\r\n                \" M 110\",\r\n                \" NGC 205\",\r\n                \" The star \u03BDAnd\",\r\n                \" The star 32And\"\r\n            ],\r\n            \"title\": \"M31 Andromeda\",\r\n            \"updated\": \"2019-04-08T14:57:34.541483\",\r\n            \"uploaded\": \"2019-04-08T07:48:00.702944\",\r\n            \"url_duckduckgo\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/duckduckgo\/\",\r\n            \"url_duckduckgo_small\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/duckduckgo_small\/\",\r\n            \"url_gallery\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/gallery\/\",\r\n            \"url_hd\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/hd\/\",\r\n            \"url_real\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/real\/\",\r\n            \"url_regular\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/regular\/\",\r\n            \"url_thumb\": \"https:\/\/www.astrobin.com\/399902\/0\/rawthumb\/thumb\/\",\r\n            \"user\": \"Nik\",\r\n            \"w\": 4702\r\n        },\r\n        {\r\n            \"animated\": false,\r\n            \"dec\": \"41.297\",\r\n            \"description\": \"Gal\u00E1xia de Andr\u00F4meda, registro feito em Itagua\u00ED , RJ - Novembro de 2018\",\r\n            \"h\": 824,\r\n            \"id\": 399372,\r\n            \"imaging_cameras\": [\r\n                \"Canon T5 Rebel\"\r\n            ],\r\n            \"imaging_telescopes\": [\r\n                \"Canon 50 f 1.8 stm Canon 50mm f1.8\"\r\n            ],\r\n            \"is_final\": true,\r\n            \"is_solved\": true,\r\n            \"license\": 0,\r\n            \"link\": \"\",\r\n            \"link_to_fits\": \"\",\r\n            \"locations\": [],\r\n            \"orientation\": \"203.612\",\r\n            \"pixscale\": \"17.705\",\r\n            \"published\": \"2019-04-05T03:26:56.152421\",\r\n            \"ra\": \"10.786\",\r\n            \"radius\": \"4.971\",\r\n            \"resource_uri\": \"\/api\/v1\/image\/399372\/\",\r\n            \"revisions\": [],\r\n            \"subjects\": [\r\n                \"M 31\",\r\n                \" Great Nebula in Andromeda\",\r\n                \" NGC 224\",\r\n                \" M 32\",\r\n                \" NGC 221\",\r\n                \" M 110\",\r\n                \" NGC 205\",\r\n                \" The star 39And\",\r\n                \" The star \u03BDAnd\",\r\n                \" The star 32And\",\r\n                \"Otro\"\r\n            ],\r\n            \"title\": \"Andromeda Galaxy\",\r\n            \"updated\": \"2019-04-05T15:47:09.219226\",\r\n            \"uploaded\": \"2019-04-05T03:26:56.275477\",\r\n            \"url_duckduckgo\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/duckduckgo\/\",\r\n            \"url_duckduckgo_small\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/duckduckgo_small\/\",\r\n            \"url_gallery\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/gallery\/\",\r\n            \"url_hd\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/hd\/\",\r\n            \"url_real\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/real\/\",\r\n            \"url_regular\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/regular\/\",\r\n            \"url_thumb\": \"https:\/\/www.astrobin.com\/399372\/0\/rawthumb\/thumb\/\",\r\n            \"user\": \"Jorgeoliveira\",\r\n            \"w\": 1846\r\n        },\r\n        {\r\n            \"animated\": false,\r\n            \"dec\": \"41.211\",\r\n            \"description\": \"\",\r\n            \"h\": 2360,\r\n            \"id\": 398979,\r\n            \"imaging_cameras\": [\r\n                \"Nikon D610 ff camera\"\r\n            ],\r\n            \"imaging_telescopes\": [\r\n                \"Teleskop Service Photoline 72 mm f\/6 APO\"\r\n            ],\r\n            \"is_final\": true,\r\n            \"is_solved\": true,\r\n            \"license\": 0,\r\n            \"link\": \"\",\r\n            \"link_to_fits\": \"\",\r\n            \"locations\": [],\r\n            \"orientation\": \"262.919\",\r\n            \"pixscale\": \"2.783\",\r\n            \"published\": \"2019-04-02T22:00:15.926002\",\r\n            \"ra\": \"10.706\",\r\n            \"radius\": \"1.638\",\r\n            \"resource_uri\": \"\/api\/v1\/image\/398979\/\",\r\n            \"revisions\": [],\r\n            \"subjects\": [\r\n                \"M 31\",\r\n                \" Great Nebula in Andromeda\",\r\n                \" NGC 224\",\r\n                \" M 32\",\r\n                \" NGC 221\",\r\n                \" M 110\",\r\n                \" NGC 205\"\r\n            ],\r\n            \"title\": \"The Andromeda Galaxy\",\r\n            \"updated\": \"2019-04-05T09:43:13.764322\",\r\n            \"uploaded\": \"2019-04-02T21:57:41.621572\",\r\n            \"url_duckduckgo\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/duckduckgo\/\",\r\n            \"url_duckduckgo_small\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/duckduckgo_small\/\",\r\n            \"url_gallery\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/gallery\/\",\r\n            \"url_hd\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/hd\/\",\r\n            \"url_real\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/real\/\",\r\n            \"url_regular\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/regular\/\",\r\n            \"url_thumb\": \"https:\/\/www.astrobin.com\/398979\/0\/rawthumb\/thumb\/\",\r\n            \"user\": \"Ken_Mitchel\",\r\n            \"w\": 3519\r\n        }\r\n    ]\r\n}";*/ /*

  MockClient mockClient;
  AstrobinDataSource dataSource;

  setUp(() {
    mockClient = MockClient();
    dataSource = AstrobinDataSource(mockClient);
  });

  group("searchForTitle", () {
    test(
      'returns AstrobinSearchTitleResult when the call completes successfully',
      () async {
        when(
          mockClient.get(
            argThat(
              startsWith('https://www.astrobin.com/api/v1/image/?format=json'),
            ),
          ),
        ).thenAnswer(
          (_) async => http.Response(
                fixture("astrobin_search_title_result"),
                200,
                headers: {'content-type': 'application/json; charset=utf-8'},
              ),
        );

        AstrobinSearchTitleResult result = await dataSource.searchForTitle(
          title: "andromeda",
        );

        expect(result, TypeMatcher<AstrobinSearchTitleResult>());
        expect(result.objects.length, 3);
        expect(result.objects[0].title, startsWith('M31 Andromeda'));
      },
    );

//Todo: No sabemos de momento que error nos devuelve.
    test('throws an error on bad request', () async {
      when(
        mockClient.get(
          argThat(
            startsWith('https://www.astrobin.com/api/v1/image/?format=json'),
          ),
        ),
      ).thenAnswer(
        (_) async => http.Response("{}", 400),
      );

      expect(
        () => dataSource.searchForTitle(title: "andromeda"),
        throwsA(TypeMatcher<AstrobinSearchError>()),
      );
    });
  });
}*/
