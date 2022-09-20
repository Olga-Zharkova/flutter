import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/views/login_view.dart';

void main() {
  group('Login view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
      //тесты для формы входа
      expect(find.text('Вход'), findsOneWidget);
      expect(find.text('Еще нет аккаунта?'), findsOneWidget);
      expect(find.text('Регистрация'), findsOneWidget);
      //ввод почты и телефона- корректный ввод и нажатие на кнопку
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.byKey(const Key('enterEmailLogin')), findsOneWidget);
      expect(find.byKey(const Key('enterPhoneLogin')), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterEmailLogin')), 'olga.534@mail.ru');
      expect(find.text('olga.534@mail.ru'), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterPhoneLogin')), '65885787976');
      expect(find.text('65885787976'), findsOneWidget);
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
      //ввод пустого значения для почты и нажатие на кнопку
      await tester.enterText(find.byKey(const Key('enterEmailLogin')), '');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);
      //ввод некорректной почты и нажатие на кнопку
      await tester.enterText(
          find.byKey(const Key('enterEmailLogin')), 'uiioohhk');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
      //ввод телефона- некорректный ввод
      await tester.enterText(
          find.byKey(const Key('enterPhoneLogin')), 'непрвр');
      expect(find.text(''), findsOneWidget);
      //ввод некорректного телефона и нажатие на кнопку
      await tester.enterText(find.byKey(const Key('enterPhoneLogin')), 'tyu');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите телефон'), findsOneWidget);

      //нажатие на кнопку для регистрации
      await tester.tap(find.text('Регистрация'));
      //обновление сет стейта
      await tester.pump();
      //тесты для формы регистрации
      expect(find.text('Регистрация'), findsOneWidget);
      expect(find.text('Уже есть аккаунт?'), findsOneWidget);
      expect(find.text('Войти'), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.byKey(const Key('enterNameRegistration')), findsOneWidget);
      expect(
          find.byKey(const Key('enterLastNameRegistration')), findsOneWidget);
      expect(find.byKey(const Key('enterPhoneRegistration')), findsOneWidget);
      expect(find.byKey(const Key('enterEmailRegistration')), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '65885787976');
      expect(find.text('65885787976'), findsOneWidget);
      //поля для имени и фамилии не пустые
      await tester.enterText(
          find.byKey(const Key('enterLastNameRegistration')), '');
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите имя'), findsOneWidget);
      expect(find.text('Введите фамилию'), findsOneWidget);
      //ввод телефона- некорректный ввод
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), 'fhgfg6');
      expect(find.text('6'), findsOneWidget);
      //При корректномм вводе данных и нажатии на кнопку отправить выводится смс
      await tester.enterText(
          find.byKey(const Key('enterNameRegistration')), 'Olga');
      await tester.enterText(
          find.byKey(const Key('enterLastNameRegistration')), 'Zharkova');
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '5678');
      await tester.enterText(
          find.byKey(const Key('enterEmailRegistration')), 'olga@mail.ru');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
  group('Login view tests', () {
    testWidgets("test description", (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: LoginView(),
        localizationsDelegates: [
          DefaultMaterialLocalizations.delegate,
          DefaultWidgetsLocalizations.delegate,
        ],
      ));
      //тесты для формы входа
      expect(find.text('Вход'), findsOneWidget);
      expect(find.text('Еще нет аккаунта?'), findsOneWidget);
      expect(find.text('Регистрация'), findsOneWidget);
      //ввод почты и телефона- корректный ввод и нажатие на кнопку
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.byKey(const Key('enterEmailLogin')), findsOneWidget);
      expect(find.byKey(const Key('enterPhoneLogin')), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterEmailLogin')), 'olga.534@mail.ru');
      expect(find.text('olga.534@mail.ru'), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterPhoneLogin')), '65885787976');
      expect(find.text('65885787976'), findsOneWidget);
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Добро пожаловать'), findsOneWidget);
      //ввод пустого значения для почты и нажатие на кнопку
      await tester.enterText(find.byKey(const Key('enterEmailLogin')), '');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите email'), findsOneWidget);
      //ввод некорректной почты и нажатие на кнопку
      await tester.enterText(
          find.byKey(const Key('enterEmailLogin')), 'uiioohhk');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Поле email заполнено не корректно'), findsOneWidget);
      //ввод телефона- некорректный ввод
      await tester.enterText(
          find.byKey(const Key('enterPhoneLogin')), 'непрвр');
      expect(find.text(''), findsOneWidget);
      //ввод некорректного телефона и нажатие на кнопку
      await tester.enterText(find.byKey(const Key('enterPhoneLogin')), 'tyu');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите телефон'), findsOneWidget);

      //нажатие на кнопку для регистрации
      await tester.tap(find.text('Регистрация'));
      //обновление сет стейта
      await tester.pump();
      //тесты для формы регистрации
      expect(find.text('Регистрация'), findsOneWidget);
      expect(find.text('Уже есть аккаунт?'), findsOneWidget);
      expect(find.text('Войти'), findsOneWidget);
      expect(find.text('Отправить'), findsOneWidget);
      expect(find.byKey(const Key('enterNameRegistration')), findsOneWidget);
      expect(
          find.byKey(const Key('enterLastNameRegistration')), findsOneWidget);
      expect(find.byKey(const Key('enterPhoneRegistration')), findsOneWidget);
      expect(find.byKey(const Key('enterEmailRegistration')), findsOneWidget);
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '65885787976');
      expect(find.text('65885787976'), findsOneWidget);
      //поля для имени и фамилии не пустые
      await tester.enterText(
          find.byKey(const Key('enterLastNameRegistration')), '');
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Введите имя'), findsOneWidget);
      expect(find.text('Введите фамилию'), findsOneWidget);
      //ввод телефона- некорректный ввод
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), 'fhgfg6');
      expect(find.text('6'), findsOneWidget);
      //При корректномм вводе данных и нажатии на кнопку отправить выводится смс
      await tester.enterText(
          find.byKey(const Key('enterNameRegistration')), 'Olga');
      await tester.enterText(
          find.byKey(const Key('enterLastNameRegistration')), 'Zharkova');
      await tester.enterText(
          find.byKey(const Key('enterPhoneRegistration')), '5678');
      await tester.enterText(
          find.byKey(const Key('enterEmailRegistration')), 'olga@mail.ru');
      await tester.tap(find.text('Отправить'));
      await tester.pump();
      expect(find.text('Вы успешно зарегистрировались'), findsOneWidget);
    });
  });
}
