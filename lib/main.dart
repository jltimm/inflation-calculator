import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

final dropdownKey = new GlobalKey<DropdownWidgetState>();

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

class DropdownWidget extends StatefulWidget {
  DropdownWidget({ Key dropdownKey }) : super(key: dropdownKey);
  DropdownWidgetState createState() => new DropdownWidgetState();
}

class DropdownWidgetState extends State<DropdownWidget> {
  String _dropdown1Value;
  String get dropdown1Value => _dropdown1Value;
  String _dropdown2Value;
  String get dropdown2Value => _dropdown2Value;

  Widget simpleDropdown() {
    return new ListTile(
      title: const Text('Simple dropdown:'),
      trailing: new DropdownButton<String>(
        value: _dropdown1Value,
        hint: const Text('Choose'),
        onChanged: (String newValue) {
          setState(() {
            _dropdown1Value = newValue;
          });
        },
        items: <String>['USD', 'GBP', 'Euro'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget hintDropdown() {
    return new ListTile(
      title: const Text('Dropdown with a hint:'),
      trailing: new DropdownButton<String>(
        value: _dropdown2Value,
        hint: const Text('Choose'),
        onChanged: (String newValue) {
          setState(() {
            _dropdown2Value = newValue;
          });
        },
        items: <String>['USD', 'GBP', 'Euro'].map((String value) {
          return new DropdownMenuItem<String>(
            value: value,
            child: new Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget buildDropdownContainer() {
    return new Container(
      padding: const EdgeInsets.all(24.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          simpleDropdown(),
          const SizedBox(
            height: 24.0,
          ),
          hintDropdown(),
          const SizedBox(
            height: 24.0,
          ),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    return buildDropdownContainer();
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