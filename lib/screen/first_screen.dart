import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/drop_down_button_menu.dart';
import '../perf_info_state.dart';
import '../service/data.dart';

class FirstPage extends ConsumerWidget {
    FirstPage({Key? key}) : super(key: key);

    //最大感染者数
    int maxPatientCount = 0;

  DataModel dataModel = DataModel();

  //必要な情報諸々ゲット
  Future getCityData(WidgetRef ref,prefValue) async {
    //何県かまでの情報が入っている ex(0,1,2
    var cityInfo = await dataModel.getCityData(prefValue);

    ref.read(prefNameProvider.notifier).state = cityInfo["name"];
    ref.read(patientNumProvider.notifier).state = cityInfo["new"];
    maxPatientCount = cityInfo['maxvalue'];
    print(ref.read(prefNumProvider));
    print(ref.read(patientNumProvider));
    print(maxPatientCount);


    //整形前の危険度
    var riskNum = ref.watch(patientNumProvider) / maxPatientCount;

    ref.read(riskProvider.notifier).state = double.parse(riskNum.toStringAsFixed(2));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int prefValue = ref.watch(prefNumProvider);
    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Center(
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
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  getCityData(ref,prefValue);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                    elevation: 10
                ),
                child: const Text("→",style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
