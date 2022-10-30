import 'package:corona_patients_number/service/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'liquid_script.dart' show liquidScript;

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  String cityName = '東京都';

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final numberProvider = ref.watch(dataProvider);


    return MaterialApp(
      // theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: Text('感染者数'),
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: 100,
            // ),
            // Center(
            //   child: Container(
            //     width: 300,
            //     child: TextFormField(
            //       decoration: InputDecoration(
            //         hintText: '都道府県名を入力してください',
            //       ),
            //       onChanged: (value) {
            //         cityName = value;
            //       },
            //     ),
            //   ),
            // ),
            // TextButton(
            //   onPressed: () {
            //     ;
            //   },
            //   child: Text('検索'),
            // ),
            // SizedBox(
            //   height: 100,
            // ),
            // Text(
            //   '$cityNameコロナ感染者累計',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            // ),
            SizedBox(
              height: 60,
            ),
            numberProvider.when(
              data: (data) => Text(
                data.toString(),
                style: TextStyle(fontSize: 30),
              ),
              error: (error, stack) => Text('怒ってます！'),
              loading: () => CircularProgressIndicator(),
            ),
            SizedBox(
              child: Echarts(
                extensions: [liquidScript],
                option: '''
                    {
                      series: [{
                          type: 'liquidFill',
                          data: [0.6]
                      }]
                    }
                  ''',
              ),
              width: 300,
              height: 300,
            ),
          ],
        ),
      ),
    );
  }
}