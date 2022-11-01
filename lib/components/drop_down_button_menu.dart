import 'package:corona_patients_number/perf_num_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'pref_data.dart';

class DropdownButtonMenu extends ConsumerWidget {

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    //選択中の都道府県表示のために形として定義しておく　可読性のために
    int prefNum = ref.watch(prefNumProvider);

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
      value: prefNum,
      onChanged: (int? value) {
          // prefValue = value!;
          ref.read(prefNumProvider.notifier).state = value!;
      },
    );
  }
}
