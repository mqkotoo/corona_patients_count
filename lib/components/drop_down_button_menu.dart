import 'package:corona_patients_number/perf_info_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pref_data.dart';

class DropdownButtonMenu extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    //選択中の都道府県表示のために形として定義しておく　可読性のために
    int prefNum = ref.watch(prefInfoProvider);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: Border.all(),
          color: Colors.white
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<int>(
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
            value: prefNum,
            onChanged: (int? value) {
                // 感染者数の数（状態）を更新
                ref.read(prefInfoProvider.notifier).state = value!;
            },
            borderRadius: BorderRadius.circular(10.0),
            // dropdownColor: Colors.indigo,
          ),
        ),
      ),
    );
  }
}
