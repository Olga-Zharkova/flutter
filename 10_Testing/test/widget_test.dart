// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/components/register_form.dart';

import 'package:testing/views/login_view.dart';

void main() {
  // group('Login view tests', () {
  //   testWidgets("test description", (WidgetTester tester) async {
  //     await tester.pumpWidget(const MaterialApp(
  //       home: LoginView(),
  //       localizationsDelegates: [
  //         DefaultMaterialLocalizations.delegate,
  //         DefaultWidgetsLocalizations.delegate,
  //       ],
  //     ));
  //     expect(find.byKey(const Key('SwitchForm')), findsOneWidget);
  //   });
  // });
  group('Register form view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: RegisterForm(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
      expect(find.byKey(GlobalKey<FormState>(debugLabel: 'registerForm')), findsOneWidget);
      //expect(find.byKey(GlobalKey(debugLabel: 'loginForm')), findsOneWidget);
    });
  });
}
