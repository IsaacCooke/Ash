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
  final _speechController = TextEditingController();

  late String text;
  bool isListening = false;
  Language nlp = Language();

  @override
  void initState(){
    text = context.loc.pressTheButtonAndStartSpeaking;
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
              controller: _speechController,
              decoration: InputDecoration(
                hintText: "${context.loc.enterYour} ${context.loc.query}",
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: (){
                  nlp.parseInput(_speechController.toString());
                  setState(() {
                    _speechController.clear();
                  });
                },
                child: Text(context.loc.submit),
              ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: toggleRecoding,
        child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
      ),
    );
  }

  Future toggleRecoding() => SpeechHelper.toggleRecording(
    onResult: (text) => setState(() => this.text = text),
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