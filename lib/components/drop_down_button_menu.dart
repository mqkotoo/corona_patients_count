import 'package:flutter/material.dart';

import 'pref_data.dart';

class DropdownButtonMenu extends StatefulWidget {
  const DropdownButtonMenu({Key? key}) : super(key: key);

  @override
  State<DropdownButtonMenu> createState() => _DropdownButtonMenuState();
}

class _DropdownButtonMenuState extends State<DropdownButtonMenu> {

  // number of tokyo
  int prefValue = 12;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      items: prefData
          .map((prefString, prefNum) {
            return MapEntry(
                prefString,
                DropdownMenuItem<int>(
                  value: prefNum,
                  child: Text(prefString),
                ));
          })
          .values
          .toList(),
      value: prefValue,
      onChanged: (int? value) {
        setState(() {
          prefValue = value!;
        });
        print(prefValue);
      },
    );
  }
}
