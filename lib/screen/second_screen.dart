import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_echarts/flutter_echarts.dart';

import '../components/liquid_script.dart';
import '../service/data.dart';

class SecondScreen extends StatefulWidget {
  final int value;

  const SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  //都道府県名
  String cityName = "";
  //感染者数
  int patientCount = 0;
  //最大感染者数
  int maxPatientCount = 0;

  bool isLoading = true;

  //危険度
  double risk = 0;

  DataModel dataModel = DataModel();

  Future getCityData() async {
    //何県かまでの情報が入っている ex(0,1,2
    var cityInfo = await dataModel.getCityData(widget.value);

    cityName = cityInfo["name"];
    patientCount = cityInfo["new"];
    maxPatientCount = cityInfo['maxvalue'];

    //整形前の危険度
    var riskNum = patientCount / maxPatientCount;

    risk = double.parse(riskNum.toStringAsFixed(2));

    isLoading = false;

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getCityData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: !isLoading
          ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cityName,
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
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
                            builder: (context) => const FirstPage()),
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
          : const Center(
              child: Text("loading..."),
            ),
    );
  }
}
