import 'package:corona_patients_number/provider/perf_info_state.dart';
import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../components/liquid_script.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var cityName = ref.watch(prefNameProvider);
    var patientCount = ref.watch(patientNumProvider);
    var risk = ref.watch(riskProvider);

    var deviceHeight = MediaQuery.of(context).size.height;
    var deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(0, 170, 0, 80),
                // color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      cityName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    SizedBox(height:20),
                    Text(
                      "危険度*",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    SizedBox(
                      height: 250,
                      width: 250,
                      child: LiquidCircularProgressIndicator(
                        value: risk,
                        valueColor: AlwaysStoppedAnimation(Colors.lightBlue[300]!), // Defaults to the current Theme's accentColor.
                        backgroundColor: const Color(0xFFECF5F4), // Defaults to the current Theme's backgroundColor.
                        borderColor: Colors.blue[800],
                        borderWidth: 6.0,
                        direction: Axis.vertical,
                        // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                        center: Text("$risk%",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Text(
                      "感染者数：${patientCount.toString()}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    SizedBox(height:20),
                    SizedBox(
                      width: deviceWidth * 0.24,
                      height: deviceHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => FirstPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 10,
                        ),
                        child: const Text(
                          "もどる",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(
                deviceWidth * 0.072,
                0,
                deviceWidth * 0.072,
                deviceHeight * 0.03,
              ),
              alignment: Alignment.bottomCenter,
              height: 35,
              child: Text(
                "* 危険度は、この都道府県の最大感染者数に対して"
                "現在の感染者数がどれくらいかで割り出しています。 情報提供：NHK",
                style: TextStyle(
                    fontSize: deviceWidth * 0.029, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
