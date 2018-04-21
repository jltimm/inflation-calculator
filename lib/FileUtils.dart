import "dart:async";
import "dart:io";
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

class FileUtils{
  Future<String> _loadFile() async {
    return await rootBundle.loadString('data/USD.json');
  }
  Future loadFile() async {
    String jsonFile = await _loadFile();
    return jsonFile;
  }
}