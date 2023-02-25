import 'package:flutter/material.dart';

import 'package:client/data/services/speech_service.dart';
import 'package:client/language/utils.dart';
import 'package:client/main.dart';

class Language{
  static BuildContext context = navigatorKey.currentState!.context;
  final SpeechService _speechService = SpeechService();
  Utils utils = Utils();

  void parseInput(String input) async {
    int intentNum = await _speechService.getIntentNum(input);

    switch(intentNum){
      case 0: {
        utils.fallback();
        break;
      }
      case 1: {
        utils.greeting();
        break;
      }
      case 2: {
        utils.newReminder();
        break;
      }
      case 3: {
        utils.joke();
        break;
      }
      case 4: {
        utils.giveFact();
        break;
      }
      case 5: {
        utils.selfFact();
        break;
      }
      case 6: {
        utils.truth();
        break;
      }
      default: {
        utils.fallback();
        break;
      }
    }
  }
}