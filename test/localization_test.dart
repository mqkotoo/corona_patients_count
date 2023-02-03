import 'package:corona_patients_number/main.dart';
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

    await tester.tap(find.text("check"));
    await tester.pumpAndSettle();
    
    expect(find.text("東京都"), findsOneWidget);
    expect(find.text("risk(%)"),findsOneWidget);

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