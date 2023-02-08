import 'dart:convert';
import 'dart:io';

import 'package:corona_patients_number/service/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'mock_test.mocks.dart';

@GenerateNiceMocks([MockSpec<http.Client>()])
main() {
  test('getPrefDataで結果が返されるかテスト', () async {
    final client = MockClient();
    when(client.get(any)).thenAnswer((_) async => http.Response(
        '''
        {
  "title": "日本国内の感染確認者数の新規・累計（最新）",
  "data47": [
    {
      "name": "北海道",
      "new": 4161,
      "cumulative": 933628,
      "newdead": 6,
      "cumulativedead": 2891,
      "ismax": false,
      "maxdate": "2022/11/9",
      "maxvalue": 9546
    },
    {
      "name": "青森県",
      "new": 377,
      "cumulative": 184830,
      "newdead": 2,
      "cumulativedead": 351,
      "ismax": false,
      "maxdate": "2022/8/25",
      "maxvalue": 2791
    },
    {
      "name": "チャーター機・国職員など",
      "new": 0,
      "cumulative": 173,
      "newdead": 0,
      "cumulativedead": 0,
      "ismax": false,
      "maxdate": "2020/4/25",
      "maxvalue": 60
    },
    {
      "name": "合計",
      "new": 37555,
      "cumulative": 23241410,
      "newdead": 48,
      "cumulativedead": 47733,
      "ismax": false,
      "maxdate": "2022/8/19",
      "maxvalue": 260922
    }
  ],
  "year": "2022年",
  "date": "11月14日",
  "lastmodifed": "11月14日 23:59",
  "lasttransmit": "11月15日 00:12",
  "updatestyle": "auto",
  "trigger": ""
}
        ''',
        200,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
        }));

    //  DI setting
    GetIt.I.registerLazySingleton<http.Client>(() => client);

    //test
    final repository = DataModel();
    final result = await repository.getPrefData(1);

    expect(result, {
      'name': '青森県',
      'new': 377,
      'cumulative': 184830,
      'newdead': 2,
      'cumulativedead': 351,
      'ismax': false,
      'maxdate': '2022/8/25',
      'maxvalue': 2791
    });
  });
}
