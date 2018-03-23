// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'textbox.dart';
import 'button.dart';

void main() {
  runApp(new MyApp());
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  String _yearBefore = "";
  String _yearAfter = "";
  String _buttonText = "USD";
  String _beforeText = "";
  String _afterText = "";

  void _handleYearBeforeChanged(String newString) {
    setState(() {
      _yearBefore = newString;
    });
  }

  void _handleYearAfterChanged(String newString) {
    setState(() {
      _yearAfter = newString;
    });
  }

  void _handleButtonChanged(String newString) {
    setState(() {
      _buttonText = newString;
    });
  }

  void _handleTextBeforeChanged(String newString) {
    setState(() {
      _beforeText = newString;
    });
  }

  void _handleTextAfterChanged(String newString) {
    setState(() {
      _afterText = newString;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new ButtonTest(
          onTextChangedButton: _handleButtonChanged,
        ),
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              new Expanded(
                child: new TextBoxTest(
                  label: "Amount",
                  onTextChanged: _handleYearBeforeChanged,
                ),
              ),
              new Expanded(
                child: new TextBoxTest(
                  label: "Year",
                  onTextChanged: _handleTextBeforeChanged,
                ),
              ),
            ],
          )
        ),
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              new Expanded(
                child: new TextBoxTest(
                  label: "Amount",
                  onTextChanged: _handleYearAfterChanged,
                ),
              ),
              new Expanded(
                child: new TextBoxTest(
                  label: "Year",
                  onTextChanged: _handleTextAfterChanged,
                ),
              ),
            ],
          )
        ),
        new ButtonTest(
          onTextChangedButton: _handleButtonChanged,
        ),
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inflation Calculator',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Inflation Calculator'),
        ),
        body: new Center(
          child: new ParentWidget(),
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'currency.dart';

// final currencyKeyBefore = new GlobalKey<CurrencyWidgetState>();
// final currencyKeyAfter = new GlobalKey<CurrencyWidgetState>();

// void main() {
//   runApp(new MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     Widget textEditSection = new TextWidget();

//     return new MaterialApp(
//       title: 'Inflation Calculator',
//       home: new Scaffold(
//         appBar: new AppBar(
//           title: new Text('Inflation Calculator'),
//         ),
//         body: new ListView(
//           children: [
//             textEditSection,
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TextWidget extends StatefulWidget {
//   TextWidget({Key key}) : super(key: key);
//   @override
//   _TextWidgetState createState() => new _TextWidgetState();
// }

// class _TextWidgetState extends State<TextWidget> {
//   String _currency1 = "";
//   String _year1 = "";
//   String _year2 = "";
//   String _dropdown1 = "";
//   String _dropdown2 = "";

//   void _validateInput() {
//     setState(() {
//       _currency1 = currencyKeyBefore.currentState.currency;
//       _year1 = currencyKeyBefore.currentState.year;
//       _year2 = currencyKeyAfter.currentState.year;
//       _dropdown1 = currencyKeyBefore.currentState.dropdownValue;
//       _dropdown2 = currencyKeyAfter.currentState.dropdownValue;
//       if (_currency1.isEmpty || _year1.isEmpty || _year2.isEmpty || _dropdown1.isEmpty || _dropdown2.isEmpty) {
//         //TODO: implement
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         new CurrencyWidget(currencyKey: currencyKeyBefore, flag: true),
//         new CurrencyWidget(currencyKey: currencyKeyAfter, flag: false),
//         const SizedBox(
//           height: 24.0,
//         ),
//         new RaisedButton(
//           onPressed: _validateInput,
//           child: new Text('Calculate')
//         ),
//         new Text('Currency 1: $_currency1'),
//         new Text('Year 1: $_year1'),
//         new Text('Dropdown 1: $_dropdown1'),
//         new Text('Year 2: $_year2'),
//         new Text('Dropdown2: $_dropdown2'),
//       ],
//     );
//   }
// }