import 'package:client/main.dart';
import 'package:flutter/material.dart';

import 'package:client/l10n/app_localizations_context.dart';
import 'package:client/language/nlp.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:client/language/speech_helper.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home>{
  @override
  BuildContext context = navigatorKey.currentState!.context;
  final _speechController = TextEditingController();

  SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = "";
  Language nlp = Language();

  @override
  void initState(){
    super.initState();
    _initSpeech();
  }

  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
    setState(() {});
  }

  void _startListening() async {
    await _speechToText.listen(onResult: _onSpeechResult);
    setState(() {});
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result){
    setState(() {
      _lastWords = result.recognizedWords;
      print(result.recognizedWords);
      nlp.parseInput(result.recognizedWords);
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16),
              child: const Text(
                "Recognised words:", //TODO Make this part of the localization package
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  _speechToText.isListening
                      ? '$_lastWords'
                      : _speechEnabled
                        ? 'Tap the microphone to start listening...' //TODO Make this part of the localization package
                        : "Speech not available", //TODO Make this part of the localization package
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(20),
                child: TextFormField(
                  controller: _speechController,
                ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                  onPressed: () {
                    String userInput = _speechController.toString();
                    nlp.parseInput(userInput);
                  },
                  child: Text(context.loc.submit),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _speechToText.isNotListening ? _startListening : _stopListening,
        child: Icon(_speechToText.isNotListening ? Icons.mic_off : Icons.mic),
      ),
    );
  }
}