import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../components/drop_down_button_menu.dart';
import '../generated/l10n.dart';
import '../provider/perf_info_state.dart';
import '../view_model/view_model.dart';

class FirstPage extends ConsumerWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final  prefValue = ref.watch(prefNumProvider);
    bool isLoading = ref.watch(isLoadingProvider);

    final deviceHeight = MediaQuery.of(context).size.height;
    final deviceWidth = MediaQuery.of(context).size.width;

    //snackBar中身定義
    SnackBar snackBar = SnackBar(
      content: Row(mainAxisAlignment: MainAxisAlignment.center, children:[
        const Icon(
          Icons.error_outline,
          color: Colors.white,
        ),
        Text(S.of(context).errorMessage),
      ]),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFE1F9F8),
      body: Builder(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                  ),
                ),
                SizedBox(height: deviceHeight * 0.067),
                const DropdownButtonMenu(),
                SizedBox(height: deviceHeight * 0.055),
                SizedBox(
                  width: deviceWidth * 0.24,
                  height: deviceHeight * 0.06,
                  child: ElevatedButton(
                    onPressed: () {
                      //getCityData関数を実行して、エラーをキャッチしたら、
                      // スナックバーを表示する
                      getCityData(ref, prefValue, context).catchError((error) {
                        var scaffold = ScaffoldMessenger.of(context);
                        scaffold.showSnackBar(snackBar);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        elevation: 10),
                    child: !isLoading
                    //小さいディスプレイの場合は、文字が二行になるのでfittedBoxで一行に収める
                        ? FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            S.of(context).check,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                fontSize: deviceHeight * 0.015,
                              ),
                            ),
                        )
                        : LoadingAnimationWidget.prograssiveDots(
                            color: Colors.blue,
                            size: deviceHeight * 0.028,
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
