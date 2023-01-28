import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:client/data/services/speech_service.dart';
import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/language/intents.dart';
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
        break;
      }
      case 5: {
        break;
      }
      case 6: {
        break;
      }
      default: {
        utils.fallback();
        break;
      }
    }
  }
}