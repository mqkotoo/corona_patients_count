// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// final dataProvider = FutureProvider((ref) async{
//   var number;
//   String cityName2 = '東京都';
//
//   http.Response response =
//       await http.get(Uri.parse(
//           "https://www3.nhk.or.jp/n-data/special/coronavirus/data/latest-pref-data-max.json",
//       ));
//
//   if (response.statusCode == 200) {
//     Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
//     number = data['data47'][0]['new'];
//     print("ok");
//   }else{
//     print("noooo");
//   }
//
//
//
//   // number = 0;
//
//   print(number);
//
//   return number;
// });

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:http/http.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {

    http.Response response =
    await http.get(Uri.parse(
      url,
    ));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      var cityInfo = data['data47'];
      return cityInfo;
    }else{
      throw Text("error code: ${response.statusCode}");
    }
  }
}