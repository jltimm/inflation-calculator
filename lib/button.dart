import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CurrencyButton extends StatefulWidget {
  CurrencyButton({Key key, @required this.onTextChangedButton})
    : super(key: key);

  final ValueChanged<String> onTextChangedButton;

  _CurrencyButtonState createState() => new _CurrencyButtonState();
}

class _CurrencyButtonState extends State<CurrencyButton> {
  String value = "";

  List<ListTile> getTiles() {
    List<ListTile> listTiles = new List<ListTile>();

    ListTile usd = new ListTile(
      leading: const Icon(Icons.attach_money),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: const Text('USD'),
      subtitle: const Text("This is used by the United States"),
      onTap: () { Navigator.of(context).pop("\$"); },
    );
    listTiles.add(usd);

    ListTile euro = new ListTile(
      leading: const Icon(Icons.euro_symbol),
      trailing: const Icon(Icons.arrow_forward_ios),
      title: const Text('Euro'),
      subtitle: const Text("This is used by Europe"),
      onTap: () { Navigator.of(context).pop("€"); },
    );
    listTiles.add(euro);

    return listTiles;
  }

  List<ListTile> getCurrencyList() {
    final divided = ListTile
      .divideTiles(
        context: context,
        tiles: getTiles(),
      ).toList();
    return divided;
  }

  void _buttonPressed() async {
    String newValue = await Navigator.of(context).push(new MaterialPageRoute<String>(
      builder: (BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('Choose Currency'),
          ),
          body: new ListView(
            children: getCurrencyList(),
          )
        );
      }
    ));
    if (newValue != null) {
      value = newValue;
      widget.onTextChangedButton(value);
    }
  }

  String getButtonLabel(){
    if (value != null && value != "") {
      return value;
    }
    else {
      return "Choose currency...";
    }
  }

  Widget build(BuildContext context) {
    return new RaisedButton(
      child: new Text(getButtonLabel()),
      onPressed: _buttonPressed,
    );
  }
}