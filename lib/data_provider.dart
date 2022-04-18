import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

final dataProvider = FutureProvider((ref) async{
  var number;

  http.Response response =
      await http.get(Uri.parse("https://opendata.corona.go.jp/api/Covid19JapanAll?date=20220215&dataName=長崎県"));


  Map<String, dynamic> data = jsonDecode(response.body);

  number = data['itemList'][0]['npatients'];

  print(number);

  return number;
});
