import 'package:flutter/material.dart';
import 'dropdown.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget dropDownSection = new DropdownWidget(dropdownKey: dropdownKey);
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
      String dropdown1 = dropdownKey.currentState.dropdown1Value;
      String dropdown2 = dropdownKey.currentState.dropdown2Value;
      if (dropdown1 != null && dropdown2 != null) {
        _currency1 = dropdownKey.currentState.dropdown1Value;
        _currency2 = dropdownKey.currentState.dropdown2Value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        new RaisedButton(
          onPressed: _updateAnswer,
          child: new Text('Calculate')
        ),
        const SizedBox(
          height: 24.0,
        ),
        new Text('Currency 1: $_currency1'),
        const SizedBox(
          height: 24.0,
        ),
        new Text('Currency 2: $_currency2')
      ],
    );
  }
}