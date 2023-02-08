import 'package:corona_patients_number/generated/l10n.dart';
import 'package:corona_patients_number/screen/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() {

  Widget myTestWidget(Locale locale) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      //多言語対応
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      home: FirstPage(),
    );
  }

  testWidgets('多言語対応のテスト 英語', (WidgetTester tester) async {
    // //アプリ起動
    // await tester.pumpWidget(ProviderScope(child: MyApp()));

    //英語でアプリ起動
    await tester.pumpWidget(ProviderScope(child: myTestWidget(Locale('en'))));
    await tester.pumpAndSettle();

    // 英語のテスト
    expect(find.text('COVID-19 risk check'), findsOneWidget);
    expect(find.text('check'), findsOneWidget);
    expect(find.text('チェック'), findsNothing);

  });

  testWidgets("多言語対応のテスト 日本語", (WidgetTester tester) async {
    //日本語でアプリ起動
    await tester.pumpWidget(ProviderScope(child: myTestWidget(Locale('ja'))));
    await tester.pumpAndSettle();

    // 日本語のテスト
    expect(find.text('コロナ危険度チェック'), findsOneWidget);
    expect(find.text('check'), findsNothing);
    expect(find.text('チェック'), findsOneWidget);
  });
}