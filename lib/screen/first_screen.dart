import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';

import '../components/drop_down_button_menu.dart';

class FirstPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButtonMenu(),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen(value: prefValue)),
                );
              },
              child: Text("tap me!"),
            ),
          ],
        ),
      ),
    );
  }
}