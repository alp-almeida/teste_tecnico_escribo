import 'dart:convert';

import 'package:ebook_reader/util/file_handler.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookREST {

  String url = 'https://escribo.com/books.json';

  Future<List> fetchBooks() async {
    List books = [];
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        books = jsonDecode(response.body);
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print(e);
    }
    return books;
  }

  Future<void> downloadBook(String link,String filename) async {
    List books = [];
    try {
      final response = await http.get(Uri.parse(link));

      if (response.statusCode == 200) {
        FileHandler().saveFile(response.bodyBytes,filename);
      } else {
        throw Exception('Failed to load books');
      }
    } catch (e) {
      print(e);
    }

  }
}