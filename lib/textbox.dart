import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class TextInput extends StatefulWidget {
  TextInput({Key key, this.label, @required this.onTextChanged})
    : super(key: key);

    final ValueChanged<String> onTextChanged;
    final String label;
    _TextInputState createState() => new _TextInputState(); 
}

class _TextInputState extends State<TextInput> {
  
  void _handleChange(String newString) {
    widget.onTextChanged(newString);
  }
 
  Widget build(BuildContext context) {
    return new TextField(
      onChanged: _handleChange,
      keyboardType: TextInputType.number,
      decoration: new InputDecoration(
        labelText: widget.label,
      ),
    );
  }
}