import 'package:flutter/material.dart';

@immutable
class TermsAndConditions extends StatelessWidget{
  const TermsAndConditions({super.key});
  static const TextStyle titleStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and conditions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: const <Widget>[
            Text(
              "Please read before using this product",
              style: titleStyle,
            ),
            Text(
              ""
            )
          ],
        ),
      ),
    );
  }
}

