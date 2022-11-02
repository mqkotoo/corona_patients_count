import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/drop_down_button_menu.dart';
import '../perf_info_state.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int prefValue = ref.watch(prefInfoProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "コロナ危険度チェック",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            const SizedBox(height: 60),
            const DropdownButtonMenu(),
            const SizedBox(height: 50),
            SizedBox(
              width: 100,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(value: prefValue)),
                  );
                },
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.black,
                    elevation: 10
                ),
                child: const Text("→",style: TextStyle(fontSize: 25),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
