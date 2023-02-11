import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/perf_info_state.dart';
import '../screen/second_screen.dart';
import '../service/data.dart';

final DataModel _dataModel = DataModel();

//必要な情報諸々ゲット
Future<void> getCityData(WidgetRef ref,int prefValue,context) async {
  var prefInfo;
  //ロード→true
  ref.read(isLoadingProvider.notifier).state = true;

  try {
    //prefInfoで何県のデータにアクセスしてるか取得できる
    prefInfo = await _dataModel.getPrefData(prefValue);
  } catch(e) {
    //ロード→false
    ref.read(isLoadingProvider.notifier).state = false;
    throw Text("error: $e");
  }

  //成功しなかったら止めて、スナックバー出す。
  //tryに成功したら以下の処理　画面遷移まで。

  ref.read(prefNameProvider.notifier).state = prefInfo["name"];
  ref.read(patientNumProvider.notifier).state = prefInfo["new"];
  
  var maxPatientCount = prefInfo['maxvalue'];
  //整形前の危険度
  var riskNum = ref.watch(patientNumProvider) / maxPatientCount;
  ref.read(riskProvider.notifier).state = double.parse(riskNum.toStringAsFixed(2));

  await Future.delayed(const Duration(seconds: 1));

  ref.read(isLoadingProvider.notifier).state = false;

  Navigator.push(context,
      MaterialPageRoute(
          builder: (context) => const SecondScreen()));
}