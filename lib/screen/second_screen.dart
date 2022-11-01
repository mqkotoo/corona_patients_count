import 'package:flutter/material.dart';

import '../service/data.dart';

class SecondScreen extends StatefulWidget {
  int value;

  SecondScreen({Key? key, required this.value}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  String cityName = "";

  int patientCount = 0;

  bool isLoading = true;

  DataModel dataModel = DataModel();

  Future getCityData() async {

    //何県かまでの情報が入っている ex(0,1,2
    var cityInfo = await dataModel.getCityData(widget.value);

    cityName = cityInfo["name"];
    patientCount = cityInfo["new"];

    print(cityName);
    print(patientCount);

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
      body: !isLoading ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(cityName),
                  Text(patientCount.toString()),
                ],
              ),
          ):Center(child: Text("loading..."),)
    );
  }
}
