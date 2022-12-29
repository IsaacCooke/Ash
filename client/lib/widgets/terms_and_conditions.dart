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
          children: <Widget>[
            const Text(
              "Please read before using this product",
              style: titleStyle,
            ),
            const Text(
              "By using this product, you must agree to the following conditions:"
            ),
            const ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text("You accept that this product can receive fully uncensored material from the internet and that material may be used by the product or shown to you")
            ),
            const ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text("You accept that this product is still in development and its features may not be complete and may change before the official release"),
            ),
            const ListTile(
              leading: Icon(Icons.fiber_manual_record),
              title: Text("You accept that any data entered into this app can be accessed by the designer, Isaac Cooke, and potentially AQA Exam Board and JCQ regulators"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: const <Widget>[
                  Text(
                    "End User License Agreement",
                    style: titleStyle,
                  ),
                  Text("This copy of ASH (\"the product\") and accompanying documentation is licenced and not sold. This product is protected by copyright laws and treaties, as well as laws and treaties relating to other forms of interlecutal property" +
                  "Isaac Cooke owns interlecutal property rights to the product. The Licensee's (\"you\" or \"your\") license to download, use, copy or change the product is subject to these rights and to all te terms and conditions in this end user license agreement (\"agreement\")."
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

