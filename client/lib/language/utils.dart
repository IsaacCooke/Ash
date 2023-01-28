import 'dart:math';

import 'package:client/main.dart';
import 'package:flutter/material.dart';

import 'package:client/language/tts.dart';
import 'package:client/language/replies.dart';
import 'package:client/widgets/create_reminder.dart';

class Utils{
  final _random = Random();
  final replies = Replies();
  TextToSpeech tts = TextToSpeech();
  BuildContext context = navigatorKey.currentState!.context;

  //TODO Put in actual responses not just samples.

  Future fallback() async {
    int selection = _random.nextInt(replies.fallbackResponses.length);
    tts.say(replies.fallbackResponses[selection]);
  }

  Future greeting() async {
    int selection = _random.nextInt(replies.greetings.length);
    tts.say(replies.greetings[selection]);
  }

  Future newReminder() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CreateReminder()),
    );
  }

  Future joke() async {
    int selection = _random.nextInt(replies.jokes.length);
    tts.say(replies.jokes[selection]);
    await Future.delayed(const Duration(seconds: 1)); // To allow tension to build
    tts.say(replies.punchlines[selection]);
  }

  Future giveFact() async {
    int selection = _random.nextInt(replies.facts.length);
    tts.say(replies.facts[selection]);
  }

  Future selfFact() async {
    int selection = _random.nextInt(replies.selfFacts.length);
    tts.say(replies.selfFacts[selection]);
  }

  Future truth() async {
    int selection = _random.nextInt(replies.truth.length);
    tts.say(replies.truth[selection]);

    //TODO find a better way to do this. It needs to be more streamlined
  }
}