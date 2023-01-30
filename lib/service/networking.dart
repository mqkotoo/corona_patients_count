import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      var prefInfo = data['data47'];
      return prefInfo;
    }else{
      throw Text("error code: ${response.statusCode}");
    }
  }
}