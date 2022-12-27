import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:client/themes/color_schemes.g.dart';
import 'package:client/pages/layout.dart';
import 'package:client/widgets/sign_up.dart';

import 'global/global.dart' as globals;

void main() {
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    Widget getStartScreen(){
      Widget startScreen;
      if(globals.getIsSignedIn == true){
        startScreen = Layout();
      } else {
        startScreen = SignUp();
      }
      return startScreen;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateTitle: (context) =>
        AppLocalizations.of(context)!.ash,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // Generic English
        Locale('es', ''), // Generic Spanish
      ],
      home: getStartScreen(),
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      navigatorKey: navigatorKey,
    );
  }
}