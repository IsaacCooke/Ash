import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:client/data/services/constants.dart';

class SpeechService{
  Future<int> getIntentNum(String text) async {
    final response = await http.post(
      Uri.parse(ApiConstants.baseUrl + ApiConstants.speechEndpoint),
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'text': text,
      }),
    );

    if(response.statusCode == 200){
      var data = json.decode(response.body);
      int intentNum = data['intentNum'];
      return intentNum;
    } else {
      throw Exception("Failed to get an answer from the server");
    }
  }
}