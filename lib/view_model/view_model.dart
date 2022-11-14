import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/perf_info_state.dart';
import '../screen/second_screen.dart';
import '../service/data.dart';

final DataModel dataModel = DataModel();

//必要な情報諸々ゲット
Future<void> getCityData(WidgetRef ref,prefValue,context) async {
  var cityInfo;
  //ロード→true
  ref.read(isLoadingProvider.notifier).state = true;

  try {
    //cityInfoで何県のデータにアクセスしてるか取得できる
    cityInfo = await dataModel.getCityData(prefValue);
  } catch(e) {
    //ロード→false
    ref.read(isLoadingProvider.notifier).state = false;
    throw Text("error: " + e.toString());
  }

  //成功しなかったら止めて、スナックバー出す。
  //tryに成功したら以下の処理　画面遷移まで。

  ref.read(prefNameProvider.notifier).state = cityInfo["name"];
  ref.read(patientNumProvider.notifier).state = cityInfo["new"];
  var maxPatientCount = cityInfo['maxvalue'];
  //整形前の危険度
  var riskNum = ref.watch(patientNumProvider) / maxPatientCount;
  ref.read(riskProvider.notifier).state = double.parse(riskNum.toStringAsFixed(2));

  await Future.delayed(const Duration(seconds: 1));

  ref.read(isLoadingProvider.notifier).state = false;

  Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => const SecondScreen()));
}