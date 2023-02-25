import 'dart:math';

import 'package:flutter/material.dart';

import 'package:text_to_speech/text_to_speech.dart';

import 'package:client/main.dart';
import 'package:client/language/replies.dart';
import 'package:client/widgets/create_reminder.dart';

class Utils {
  final _random = Random();
  final replies = Replies();
  TextToSpeech tts = TextToSpeech();
  BuildContext context = navigatorKey.currentState!.context;

  Future fallback() async {
    int selection = _random.nextInt(replies.fallbackResponses.length);
    tts.speak(replies.fallbackResponses[selection]);
  }

  Future greeting() async {
    int selection = _random.nextInt(replies.greetings.length);
    tts.speak(replies.greetings[selection]);
  }

  Future newReminder() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateReminder()),
    );
  }

  Future joke() async {
    int selection = _random.nextInt(replies.jokes.length);
    tts.speak(replies.jokes[selection]);
    await Future.delayed(const Duration(seconds: 1)); // To allow tension to build
    tts.speak(replies.punchlines[selection]);
  }

  Future giveFact() async {
    int selection = _random.nextInt(replies.facts.length);
    tts.speak(replies.facts[selection]);
  }

  Future selfFact() async {
    int selection = _random.nextInt(replies.selfFacts.length);
    tts.speak(replies.selfFacts[selection]);
  }

  Future truth() async {
    int selection = _random.nextInt(replies.truth.length);
    tts.speak(replies.truth[selection]);
  }
}