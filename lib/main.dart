import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Widget dropDownSection = new DropdownWidget();
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
  @override
  _DropdownWidgetState createState() => new _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  
  String dropdown1Value;
  String dropdown2Value;
  String dropdown3Value = 'Four';

  Widget simpleDropdown() {
    return new ListTile(
      title: const Text('Simple dropdown:'),
      trailing: new DropdownButton<String>(
        value: dropdown1Value,
        hint: const Text('Choose'),
        onChanged: (String newValue) {
          setState(() {
            dropdown1Value = newValue;
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
        value: dropdown2Value,
        hint: const Text('Choose'),
        onChanged: (String newValue) {
          setState(() {
            dropdown2Value = newValue;
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

  Widget scrollableDropdown() {
    return new ListTile(
      title: const Text('Scrollable dropdown:'),
      trailing: new DropdownButton<String>(
        value: dropdown3Value,
        onChanged: (String newValue) {
          setState(() {
            dropdown3Value = newValue;
          });
        },
        items: <String>[
            'One', 'Two', 'Free', 'Four', 'Can', 'I', 'Have', 'A', 'Little',
            'Bit', 'More', 'Five', 'Six', 'Seven', 'Eight', 'Nine', 'Ten'
            ]
          .map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: new Text(value),
            );
          })
          .toList(),
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
          //scrollableDropdown(),
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
  int _counter = 1;

  void _updateAnswer() {
    setState(() {
      _counter += 1;
      if (_counter > 20) {
        _counter = 1;
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
        new Text('Name: $_counter'),
      ],
    );
  }
}