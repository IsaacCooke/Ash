// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:client/data/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:client/main.dart';
import 'package:client/data/services/speech_service.dart';

void main() {
  test('Check webhook', () async {
    final speechService = SpeechService();
    await speechService.getIntentNum("hello there");
  });
}
