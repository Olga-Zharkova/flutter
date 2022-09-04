
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing/views/login_view.dart';

void main() {
  testWidgets('Login view tesrs', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginView(),
      ),
    );
    expect(find.byKey(const Key('SwitchForm')), findsOneWidget);
  });
}

//expect(find.byKey(GlobalKey(debugLabel: 'registerForm')), findsOneWidget);
//expect(find.byKey(GlobalKey(debugLabel: 'loginForm')), findsOneWidget);