import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'currency.dart';

final dropdownKeyBefore = new GlobalKey<DropdownWidgetState>();
final currencyKeyBefore = new GlobalKey<CurrencyWidgetState>();
final currencyKeyAfter = new GlobalKey<CurrencyWidgetState>();

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget dropDownSection = new DropdownWidget(dropdownKey: dropdownKeyBefore, label1: "test", label2: "test2",);
    Widget textEditSection = new TextWidget();

    return new MaterialApp(
      title: 'Inflation Calculator',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Inflation Calculator'),
        ),
        body: new ListView(
          children: [
            dropDownSection,
            textEditSection,
          ],
        ),
      ),
    );
  }
}

class TextWidget extends StatefulWidget {
  TextWidget({Key key}) : super(key: key);
  @override
  _TextWidgetState createState() => new _TextWidgetState();
}

class _TextWidgetState extends State<TextWidget> {
  String _currency1 = "";
  String _currency2 = "";

  void _updateAnswer() {
    setState(() {
      String dropdown1 = dropdownKeyBefore.currentState.dropdown1Value;
      String dropdown2 = dropdownKeyBefore.currentState.dropdown2Value;
      if (dropdown1 != null) {
        _currency1 = dropdownKeyBefore.currentState.dropdown1Value;
      }
      if (dropdown2 != null) {
        _currency2 = dropdownKeyBefore.currentState.dropdown2Value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 24.0,
        ),
        new Text('Currency 1: $_currency1'),
        const SizedBox(
          height: 24.0,
        ),
        new Text('Currency 2: $_currency2'),
        new CurrencyWidget(currencyKey: currencyKeyBefore, flag: true),
        new CurrencyWidget(currencyKey: currencyKeyAfter, flag: false),
        const SizedBox(
          height: 24.0,
        ),
        new RaisedButton(
          onPressed: _updateAnswer,
          child: new Text('Calculate')
        ),
      ],
    );
  }
}