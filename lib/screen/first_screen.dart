import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/drop_down_button_menu.dart';
import '../perf_num_state.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int prefValue = ref.watch(prefNumProvider);

    print(prefValue);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonMenu(),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                print(prefValue);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SecondScreen(value: prefValue)),
                );
              },
              child: const Text("tap me!"),
            ),
          ],
        ),
      ),
    );
  }
}
