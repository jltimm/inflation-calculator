import 'package:flutter/material.dart';

class CurrencyWidget extends StatefulWidget {
  final bool flag;
  CurrencyWidget({Key currencyKey, this.flag}) : super(key: currencyKey);
  CurrencyWidgetState createState() => new CurrencyWidgetState();

}

class CurrencyWidgetState extends State<CurrencyWidget> {

  final TextEditingController _yearController = new TextEditingController();
  String get year => _yearController.text;

  final TextEditingController _currencyController = new TextEditingController();
  String get currency => _currencyController.text;

  String _dropdownValue;
  String get dropdownValue => _dropdownValue;

  Widget createDropdown(bool flag) {
    return new DropdownButton<String>(
      value: _dropdownValue,
      hint: const Text('Choose'),
      onChanged: (String newValue) {
        setState(() {
          _dropdownValue = newValue;
        });
      },
      items: <String>['USD', 'GBP', 'Euro'].map((String value) {
        return new DropdownMenuItem<String>(
          value: value,
          child: new Text(value),
        );
      }).toList(),
    );
  }

  Widget createYearInput() {
    return new TextField(
      controller: _yearController,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(labelText: "Enter year"),
    );
  }

  Widget createCurrencyInput(bool flag) {
    if (flag) {
      return new TextField(
        controller: _currencyController,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(labelText: "Enter amount(\$)"),
      );
    }
    return const SizedBox(
      height: 24.0,
    );
  }

  Widget build(BuildContext context) {
    return new Column(
      children: [
        createCurrencyInput(widget.flag),
        createYearInput(),
        createDropdown(widget.flag)
      ]
    );
  }
}

