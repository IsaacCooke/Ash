import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/language/intents.dart';
import 'package:client/language/utils.dart';
import 'package:client/main.dart';

class Language{
  static BuildContext context = navigatorKey.currentState!.context;

  static final greetings = [context.loc.hello, context.loc.helloHowAreYouToday, context.loc.hi, context.loc.hiHowAreYouFeelingToday];
  static final phrases = [greetings];

  parseInput(String input){
    Utils utils = Utils();
    input = input.toLowerCase();
    Intents intent = Intents.none;

    for(var phrase in phrases){
      for(var word in phrase){
        switch(phrase){
          // case greetings: {
          //   intent = Intents.greeting;
        }
        break;
      }
    }
  }
}

//TODO: Find a better way to do this. I should try to define the statements away from the other localization in a separate dart/ json file. This could also allow arrays and won't annoy the switch statement.