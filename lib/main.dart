import 'package:flutter/material.dart';
import 'textbox.dart';
import 'button.dart';
import 'dart:async';
import 'FileUtils.dart';

void main() {
  runApp(new InflationCalculator());
}

class Home extends StatefulWidget {
  final FileUtils fileUtils;
  Home({Key key, this.fileUtils}) : super(key: key);
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {

  String dater = "";
  
  String _yearBefore = "";
  String _yearAfter = "";
  String _currencyBefore = "";
  String _buttonBefore = "";
  String _buttonAfter = "";
  String _value = "";

  @override
  void initState() {
    super.initState();
    widget.fileUtils.loadFile().then((String value) {
      dater = value;
      print(dater);
    });
  }

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

  Widget buildBeforeInput()
  {

    return new Column(
      children: [
        new CurrencyButton(
          onTextChangedButton: _handleButtonBeforeChanged,
        ),
        new Container(
          padding: const EdgeInsets.all(10.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Expanded(
                child: new TextInput(
                  label: "Amount",
                  onTextChanged: _handleCurrencyBeforeChanged,
                ),
              ),
              new Expanded(
                child: new TextInput(
                  label: "Year",
                  onTextChanged: _handleYearBeforeChanged,
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
              new Expanded(
                child: new Text(
                  '$_value',
                ),
              ),
              new Expanded(
                child: new TextInput(
                  label: "Year",
                  onTextChanged: _handleYearAfterChanged,
                ),
              ),
            ],
          )
        ),
        new CurrencyButton(
          onTextChangedButton: _handleButtonAfterChanged,
        ),
      ],
    );
  }

  Text _buildErrorList(List<String> errors) {
    String errorString = "";
    for (int i = 0; i < errors.length; i++) {
      errorString += (i+1).toString() + ") " + errors[i];
      if (i != errors.length-1) {
        errorString += "\n";
      }
    }
    return new Text(errorString);
  }

  Future<Null> _createBadDataAlertDialog(List<String> message) async {
    return showDialog<Null>(
      context: context,
      barrierDismissible: false,
      child: new AlertDialog(
        title: new Text('There are ' + (message.length).toString() + ' errors.'),
        content: _buildErrorList(message),
        actions: [
          new FlatButton(
            child: new Text('Dismiss'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _calculate() {
    int yearBeforeInt;
    int yearAfterInt;
    double currencyBeforeDouble;
    var errors = [];
    try {
      yearBeforeInt = int.parse(_yearBefore);
    } catch(exception) {
      errors.add("Year before is empty or not a number.");
    }
    try {
      yearAfterInt = int.parse(_yearAfter);
    } catch(exception) {
      errors.add("Year after is empty or not a number.");
    }
    try {
      currencyBeforeDouble = double.parse(_currencyBefore);
    } catch(exception) {
      errors.add("Amount is empty or not a number.");;
    }
    if (errors.length > 0) {
      _createBadDataAlertDialog(errors);
    }
    setState(() {
      if (yearBeforeInt != null && yearAfterInt != null && currencyBeforeDouble != null) {
        _value = (yearBeforeInt + yearAfterInt + currencyBeforeDouble).toString();
      }
    });
  }

  Widget buildCalculateButton() {
    return new RaisedButton(
      child: const Text("Calculate"),
      onPressed: _calculate,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        buildBeforeInput(),
        buildAfterInput(),
        buildCalculateButton(),
      ],
    );
  }
}

class InflationCalculator extends StatelessWidget {
  final FileUtils newFileUtils = new FileUtils();
  // String path = "";
  // newFileUtils.localFile.then
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Inflation Calculator',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("IF"),
        ),
        body: new Center(
          child: new Home(fileUtils: new FileUtils()),
        ),
      ),
    );
  }
}