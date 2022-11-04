import 'package:corona_patients_number/perf_info_state.dart';
import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/liquid_script.dart';
import '../service/data.dart';

class SecondScreen extends ConsumerWidget {

    SecondScreen({Key? key}) : super(key: key);

  //都道府県名
  late String cityName;
  //感染者数
  late int patientCount;
  //最大感染者数
  late int maxPatientCount;

  //危険度
  late double risk;



  @override
  Widget build(BuildContext context,WidgetRef ref) {

    cityName = ref.watch(prefNameProvider);
    patientCount = ref.watch(patientNumProvider);
    risk = ref.watch(riskProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cityName,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
                // SizedBox(height: 30),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    //危険度
                    SizedBox(
                      child: Echarts(
                        extensions: const [liquidScript],
                        option: '''
                  {
                    series: [{
                        type: 'liquidFill',
                        data: [$risk]
                    }]
                  }
                ''',
                      ),
                      width: 500,
                      height: 416,
                    ),
                    Positioned(
                      top: 50,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 160),
                        child: const Text(
                          "危険度",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 130),
                        child: Text(
                          "感染者数：${patientCount.toString()}",
                          style: const TextStyle(fontSize: 22),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FirstPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      onPrimary: Colors.black,
                      elevation: 10,
                    ),
                    child: const Text("←",style: TextStyle(fontSize: 25),),
                  ),
                ),
                // SizedBox(height: 20),

                const SizedBox(height: 20),
                // Text("max感染者数：${maxPatientCount.toString()}"),
                // SizedBox(height:30),
              ],
            ),
          )
    );
  }
}
