import 'package:astrobin_app/network/astrobin_data_source.dart';
import 'package:astrobin_app/model/search_title/model_search_title.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  String fixture(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

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
                fixture('astrobin_search_title_result'),
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
}
