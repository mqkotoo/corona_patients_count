import 'package:corona_patients_number/perf_info_state.dart';
import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/liquid_script.dart';

class SecondScreen extends ConsumerWidget {

    const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    var cityName = ref.watch(prefNameProvider);
    var patientCount = ref.watch(patientNumProvider);
     var risk = ref.watch(riskProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  cityName,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 36),
                ),
                // SizedBox(height: 30),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
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
                    const Positioned(
                      top: 50,
                      child: Text(
                        "危険度*",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 40,
                      child: Text(
                        "感染者数：${patientCount.toString()}",
                        style: const TextStyle(fontSize: 22),
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
                SizedBox(height: 30),
                Text(
                    "*危険度は、最大感染者数に比べて"
                    "現在の感染者数がどれくらいいるかで割り出しています。",
                )
              ],
            ),
          )
    );
  }
}
