// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'textbox.dart';
import 'button.dart';

void main() {
  runApp(new InflationCalculator());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String _yearBefore = "";
  String _yearAfter = "";
  String _currencyBefore = "";
  //String _currencyAfter = "";
  String _buttonBefore = "USD";
  String _buttonAfter = "USD";

  void _handleYearBeforeChanged(String newString) {
    setState(() {
      _yearBefore = newString;
    });
  }

  // void _handleYearAfterChanged(String newString) {
  //   setState(() {
  //     _yearAfter = newString;
  //   });
  // }

  void _handleButtonBeforeChanged(String newString) {
    setState(() {
      _buttonBefore = newString;
    });
  }

  void _handleButtonAfterChanged(String newString) {
    setState(() {
      _buttonAfter = newString;
    });
  }

  void _handleCurrencyBeforeChanged(String newString) {
    setState(() {
      _currencyBefore = newString;
    });
  }

  void _handleCurrencyAfterChanged(String newString) {
    setState(() {
      _currencyAfter = newString;
    });
  }

  Widget buildBeforeInput() {
    return new Column(
      children: [
        new ButtonTest(
          onTextChangedButton: _handleButtonBeforeChanged,
        ),
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Expanded(
                child: new TextBoxTest(
                  label: "Amount",
                  onTextChanged: _handleYearBeforeChanged,
                ),
              ),
              new Expanded(
                child: new TextBoxTest(
                  label: "Year",
                  onTextChanged: _handleCurrencyBeforeChanged,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget buildAfterInput() {
    return new Column(
      children: [
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[
              // new Expanded(
              //   child: new TextBoxTest(
              //     label: "Amount",
              //     onTextChanged: _handleYearAfterChanged,
              //   ),
              // ),
              new Expanded(
                child: new TextBoxTest(
                  label: "Year",
                  onTextChanged: _handleCurrencyAfterChanged,
                ),
              ),
            ],
          )
        ),
        new ButtonTest(
          onTextChangedButton: _handleButtonAfterChanged,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Expanded(
          flex: 1,
          child: buildBeforeInput(),
        ),
        new Expanded(
          flex: 2,
          child: buildAfterInput(),
        )
      ],
    );
  }
}

class InflationCalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inflation Calculator',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Inflation Calculator'),
        ),
        body: new Center(
          child: new Home(),
        ),
      ),
    );
  }
}