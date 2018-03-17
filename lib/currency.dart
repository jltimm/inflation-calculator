import 'package:flutter/material.dart';

final currencyKey = new GlobalKey<CurrencyWidgetState>();

class CurrencyWidget extends StatefulWidget {
  final bool flag;
  CurrencyWidget({Key currencyKey, this.flag}) : super(key: currencyKey);
  CurrencyWidgetState createState() => new CurrencyWidgetState();

}

class CurrencyWidgetState extends State<CurrencyWidget> {
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Text(widget.flag.toString()),
        createCurrencyInput(widget.flag),
      ]
    );
  }
}

Widget createCurrencyInput(bool flag) {
  if (flag) {
    return new TextField(
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(labelText: "Enter amount(\$)"),
    );
  }
  return const SizedBox(
            height: 24.0,
  );
}

