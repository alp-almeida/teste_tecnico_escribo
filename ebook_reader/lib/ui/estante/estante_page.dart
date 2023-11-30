import 'package:ebook_reader/model/book.dart';
import 'package:ebook_reader/ui/components/book_view.dart';
import 'package:flutter/material.dart';

import '../../rest/book_rest.dart';

class Estante extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => EstanteState();

}

class EstanteState extends State<Estante>{
  List<Book> array = [];


  @override
  void initState() {
    getRestBooks();
  }

  Future getRestBooks() async {
    var lista = (await BookREST().fetchBooks()).map((e) => Book.from(e)).toList();
    setState(() {
      array = lista;
    });
  }

  @override
  Widget build(BuildContext context) {

    var grid = GridView.count(
      restorationId: 'grid_view_demo_grid_offset',
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      padding: const EdgeInsets.all(8),
      childAspectRatio: 1,
      children: array.map((e) => BookView(book: e)).toList()
    );

    return Center(
      child: grid,
    );

  }

}