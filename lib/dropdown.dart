import 'package:flutter/material.dart';

final dropdownKey = new GlobalKey<DropdownWidgetState>();

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