import 'dart:math';

import 'package:client/language/tts.dart';
import 'package:client/language/replies.dart';

class Utils{
  final _random = Random();
  final replies = Replies();
  TextToSpeech tts = TextToSpeech();

  //TODO Put in actual responses not just samples.

  Future fallback() async {
    int selection = _random.nextInt(replies.fallbackResponses.length);
    tts.say(replies.fallbackResponses[selection]);
  }

  Future greeting() async {
    int selection = _random.nextInt(replies.greetings.length);
    tts.say(replies.greetings[selection]);
  }

  Future joke() async {
    int selection = _random.nextInt(replies.jokes.length);
    tts.say(replies.jokes[selection]);
    await Future.delayed(const Duration(seconds: 1)); // To allow tension to build
    tts.say(replies.punchlines[selection]);
  }
}