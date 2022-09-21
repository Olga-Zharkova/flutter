// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Login form tests', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final filedFinderTitle = find.text('Вход');
    final filedFinderEmail = find.byValueKey('enterEmailLogin');
    final filedFinderPhone = find.byValueKey('enterPhoneLogin');
    final filedFinderButtonSend = find.text('Отправить');
    final filedFinderButtonRegistration = find.text('Регистрация');

    test('Availability of an entry form', () async {
      expect(await driver!.getText(filedFinderTitle), 'Вход');
      expect(
          await driver!.getText(filedFinderButtonRegistration), 'Регистрация');
    });

    test('Text email field', () async {
      await driver!.tap(filedFinderEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('olga@mail.ru');
      await driver!.waitFor(find.text('olga@mail.ru'));
    });
    test('Text phone field', () async {
      await driver!.tap(filedFinderPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('567899');
      await driver!.waitFor(find.text('567899'));
    });
    test('Send data', () async {
      await driver!.tap(filedFinderButtonSend);
    });
    test('Success text', () async {
      final success = find.text('Добро пожаловать');
      expect(await driver!.getText(success), 'Добро пожаловать');
    });
    test('Incorrect phone number', () async {
      await driver!.tap(filedFinderPhone);
      await driver!.enterText('павар67');
      await driver!.waitFor(find.text('67'));
    });
    test('Phone is empty', () async {
      await driver!.tap(filedFinderPhone);
      await driver!.enterText('');
      await driver!.tap(filedFinderButtonSend);
      final warningPhone = find.text('Введите телефон');
      expect(await driver!.getText(warningPhone), 'Введите телефон');
    });
    test('Incorrect email', () async {
      await driver!.tap(filedFinderEmail);
      await driver!.enterText('olga.mail');
      await driver!.tap(filedFinderButtonSend);
      final warningEmail = find.text('Поле email заполнено не корректно');
      expect(await driver!.getText(warningEmail),
          'Поле email заполнено не корректно');
    });
    test('Email is empty', () async {
      await driver!.tap(filedFinderEmail);
      await driver!.enterText('');
      await driver!.tap(filedFinderButtonSend);
      final warningEmail = find.text('Введите email');
      expect(await driver!.getText(warningEmail), 'Введите email');
    });
  });

  group('Start register form from login form', () {
    FlutterDriver? driver;
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    final enterRegistrationForm = find.text('Регистрация');
    test('Switching to the registration form', () async {
      await driver!.tap(enterRegistrationForm);
    });
  });

  group('Register form ', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
    final enterRegistrationForm = find.text('Регистрация');
    final filedFinderTitle = find.text('Регистрация');
    final filedFinderName = find.byValueKey('enterNameRegistration');
    final filedFinderLastName = find.byValueKey('enterLastNameRegistration');
    final filedFinderEmail = find.byValueKey('enterEmailRegistration');
    final filedFinderPhone = find.byValueKey('enterPhoneRegistration');
    final filedFinderButtonSend = find.text('Отправить');
    final filedFinderButtonRegistration = find.text('Войти');

    test('Availability of the registration form', () async {
      expect(await driver!.getText(filedFinderTitle), 'Регистрация');
      expect(await driver!.getText(filedFinderButtonRegistration), 'Войти');
    });
    test('Text name field', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Olga');
      await driver!.waitFor(find.text('Olga'));
    });
    test('Text last name field', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderLastName);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('Zharkova');
      await driver!.waitFor(find.text('Zharkova'));
    });
    test('Text phone field', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderPhone);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('567899');
      await driver!.waitFor(find.text('567899'));
    });
    test('Text email field', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderEmail);
      await driver!.waitFor(find.text(''));
      await driver!.enterText('olga.534@mail.ru');
      await driver!.waitFor(find.text('olga.534@mail.ru'));
    });
    test('Send data', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderButtonSend);
    });
    test('Success text', () async {
      await driver!.tap(enterRegistrationForm);
      final success = find.text('Вы успешно зарегистрировались');
      expect(await driver!.getText(success), 'Вы успешно зарегистрировались');
    });
    test('The name and lastName fields are not empty', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderName);
      await driver!.enterText('');
      await driver!.tap(filedFinderLastName);
      await driver!.enterText('');
      await driver!.tap(filedFinderButtonSend);
      final warningName = find.text('Введите имя');
      final warningLastName = find.text('Введите фамилию');
      expect(await driver!.getText(warningName), 'Введите имя');
      expect(await driver!.getText(warningLastName), 'Введите фамилию');
    });
    test('Incorrect phone number', () async {
      await driver!.tap(enterRegistrationForm);
      await driver!.tap(filedFinderPhone);
      await driver!.enterText('павар67');
      await driver!.waitFor(find.text('67'));
    });
  });
}
