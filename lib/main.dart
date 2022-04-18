import 'package:corona_patients_number/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/cupertino.dart';



void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final numberProvider = ref.watch(dataProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('感染者数'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '長崎県コロナ感染者累計',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 60,
              ),
              numberProvider.when(
                  data: (data) => Text(data,style: TextStyle(fontSize: 40),),
                  error: (error,stack) => Text('怒ってます！'),
                  loading: () => CircularProgressIndicator()
              )
            ],
          ),
        ),
      ),
    );
  }
}
