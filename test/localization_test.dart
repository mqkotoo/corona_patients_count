import 'package:corona_patients_number/main.dart';
import 'package:corona_patients_number/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('多言語対応のテスト', (WidgetTester tester) async {
    //アプリ起動
    await tester.pumpWidget(ProviderScope(child: MyApp()));

    // Verify that the widget is displayed correctly in English
    expect(find.text('COVID-19 risk check'), findsOneWidget);
    expect(find.text('check'), findsOneWidget);
    expect(find.text('チェック'), findsNothing);
    expect(find.byKey(ValueKey("check_button")),findsOneWidget);

    // await tester.tap(find.byKey(ValueKey("check_button")));
    // await tester.pump();
    // expect(find.byType(SecondScreen),findsOneWidget);
    // await tester.pumpAndSettle();
    // expect(find.byType(SecondScreen),findsOneWidget);;

    //遷移できているか
    // expect(find.byKey(ValueKey("back_button")), findsOneWidget);
    
    // expect(find.text("back"), findsOneWidget);
    // expect(find.text('COVID-19 risk check'), findsNothing);
    // expect(find.text("risk(%)"),findsOneWidget);

    // // Change the locale to Japanese
    // //日本語設定でビルド
    // await tester.pumpWidget(myAppTest('ja'));
    // await tester.pumpAndSettle();

    // Verify that the widget is displayed correctly in Japanese
    // expect(find.text('コロナ危険度チェック'), findsOneWidget);
    // await tester.tap(find.widgetWithText(ElevatedButton, "チェック"));
    // await tester.pumpAndSettle();
    // expect(find.text('危険度（％）'), findsOneWidget);
  });
}