// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:client/data/services/speech_service.dart';

void main() {
  test('Check webhook', () async {
    final speechService = SpeechService();
    int num = await speechService.getIntentNum("hello there");
    expect(num, 1);
  });
}
