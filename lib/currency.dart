import 'package:flutter/material.dart';

final currencyKey = new GlobalKey<CurrencyWidgetState>();

class CurrencyWidget extends StatefulWidget {
  final bool test1;
  final bool test2;
  CurrencyWidget({Key currencyKey, this.test1, this.test2}) : super(key: currencyKey);

  CurrencyWidgetState createState() => new CurrencyWidgetState();

}

Widget createNumberField() {
    return new TextField(
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(labelText: "Enter amount(\$)"),
    );
  }


class CurrencyWidgetState extends State<CurrencyWidget> {
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Text(widget.test1.toString()),
        new Text(widget.test2.toString()),
        createNumberField(),
      ]
    );
  }
}