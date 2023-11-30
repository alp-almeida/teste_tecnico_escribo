import 'dart:io';

import 'package:flutter/foundation.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class FileHandler {
  
  Future saveFile(List<int> codeunits, String fileName) async {
    await Permission.storage.request();
    Directory directory = await getApplicationDocumentsDirectory();
    File file = File('${directory.path}/$fileName');
    await file.writeAsBytes(codeunits);
    print('File saved to ${file.path}');
  }

  Future<void> downloadAndSaveFile(String url, String fileName) async {
    // Request permissions


    // Download the file from the internet
    http.Response response = await http.get(Uri.parse(url));

    // Save the file to the phone storage

  }
  
}