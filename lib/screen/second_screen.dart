import 'package:corona_patients_number/provider/perf_info_state.dart';
import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../generated/l10n.dart';

class SecondScreen extends ConsumerWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cityName = ref.watch(prefNameProvider);
    final patientCount = ref.watch(patientNumProvider);
    final risk = ref.watch(riskProvider);

    //危険度割合を100枚して四捨五入して整数にしている
    final int riskText = (risk * 100).round();

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: deviceHeight * 0.067),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cityName,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 36),
                    ),
                    const SizedBox(height:40),
                    Text(
                      S.of(context).riskLabel,
                      // "危険度*",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                        height: 250,
                        width: 250,
                        child: LiquidCircularProgressIndicator(
                          value: risk,
                          valueColor: AlwaysStoppedAnimation(Colors.lightBlue[400]!), // Defaults to the current Theme's accentColor.
                          backgroundColor: const Color(0xFFECF5F4), // Defaults to the current Theme's backgroundColor.
                          borderColor: Colors.blue[800],
                          borderWidth: 6.0,
                          direction: Axis.vertical,
                          center: Text("$riskText%",style: const TextStyle(fontSize: 35,fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Text(
                      "${S.of(context).infectedPatients}：${patientCount.toString()}",
                      style: const TextStyle(fontSize: 22),
                    ),
                    const SizedBox(height:40),
                    SizedBox(
                      width: deviceWidth * 0.24,
                      height: deviceHeight * 0.06,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => const FirstPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 10,
                        ),
                        child: Text(
                          S.of(context).back,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: deviceHeight * 0.015,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(child: SizedBox.shrink()),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: deviceWidth * 0.072),
                child: Text(
                  S.of(context).description,
                  style: const TextStyle(
                      fontSize: 10, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
