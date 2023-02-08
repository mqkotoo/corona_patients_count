import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    //get it 使ってhttpクライアント設定
    final http.Client client = GetIt.I<http.Client>();

    http.Response response =
    await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      var prefInfo = data['data47'];
      return prefInfo;
    }else{
      throw Text("error code: ${response.statusCode}");
    }
  }
}