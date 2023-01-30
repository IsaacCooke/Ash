import 'package:client/main.dart';
import 'package:flutter/material.dart';

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/language/nlp.dart';
import 'package:client/language/speech_helper.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  @override
  BuildContext context = navigatorKey.currentState!.context;

  late String initialText;
  bool isListening = false;
  Language nlp = Language();

  @override
  void initState(){
    initialText = context.loc.pressTheButtonAndStartSpeaking;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        padding: const EdgeInsets.all(30).copyWith(bottom: 150),
        child: Text(initialText),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: toggleRecoding,
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
      ),
    );
  }

  Future toggleRecoding() => SpeechHelper.toggleRecording(
    onResult: (text) => setState(() => this.initialText = text),
    onListening: (isListening){
      setState(() {
        this.isListening = isListening;
      });

      if(!isListening){
        Future.delayed(const Duration(seconds: 1), (){
          nlp.parseInput(text);
        });
      }
    }
  );
}