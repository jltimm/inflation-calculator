import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TextBoxTest extends StatefulWidget {
  TextBoxTest({Key key, this.label, @required this.onTextChanged})
    : super(key: key);

    final ValueChanged<String> onTextChanged;
    final String label;
    _TextBoxTestState createState() => new _TextBoxTestState(); 
}

class _TextBoxTestState extends State<TextBoxTest> {
  
  void _handleChange(String newString) {
    widget.onTextChanged(newString);
  }
 
  Widget build(BuildContext context) {
    return new TextField(
      onChanged: _handleChange,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        //contentPadding: const EdgeInsets.all(1.0),
        labelText: widget.label,
      ),
    );
  }
}