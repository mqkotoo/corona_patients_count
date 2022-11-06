import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/drop_down_button_menu.dart';
import '../perf_info_state.dart';
import '../service/data.dart';

class FirstPage extends ConsumerWidget {
    FirstPage({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int prefValue = ref.watch(prefNumProvider);
    bool isLoading = ref.watch(isLoadingProvider);

    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "コロナ危険度チェック",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(height: 60),
                const DropdownButtonMenu(),
                const SizedBox(height: 50),
                SizedBox(
                  width: deviceWidth * 0.24,
                  height: deviceHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      //getCityData関数を実行して、エラーをキャッチしたら、
                      // スナックバーを表示する
                      getCityData(ref,prefValue,context).catchError((error) {
                        var scaffold = ScaffoldMessenger.of(context);
                        scaffold.showSnackBar(
                          const SnackBar(
                            content: Center(child: Text('エラーが発生しました！')),
                          ),
                        );
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                        elevation: 10
                    ),
                    child: !isLoading ?
                    const Text("→",style: TextStyle(fontSize: 25),)
                        : LoadingAnimationWidget.prograssiveDots(
                      color: Colors.blue,
                      size: 25,
                    ),
                    )
                  ),
              ],
            ),
          );
        }
      ),
    );
  }
}
