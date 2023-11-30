import 'package:ebook_reader/model/book.dart';
import 'package:ebook_reader/rest/book_rest.dart';
import 'package:flutter/material.dart';

class BookView extends StatelessWidget {
  Book book;
  BookView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {

    final Widget image = Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        clipBehavior: Clip.antiAlias,
        child: Image(image: NetworkImage(book.coverUrl), fit: BoxFit.fitHeight,)
    );

    return GestureDetector(
      onTap: () async {
        await BookREST().downloadBook(book.downloadUrl, book.title.replaceAll(" ", "_"));
      },
      child: GridTile(
        footer: Material(
          color: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
          ),
          clipBehavior: Clip.antiAlias,
          child: GridTileBar(
            backgroundColor: Colors.black45,
            title: _GridTitleText(book.title),
            subtitle: _GridTitleText(book.author),
          ),
        ),
        child: image,
      ),
    );
  }
}

/// Allow the text size to shrink to fit in the space
class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(text),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  Image photo;
  _GridDemoPhotoItem({ required this.photo }) ;


  @override
  Widget build(BuildContext context) {


    final Widget image = Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      clipBehavior: Clip.antiAlias,
      child: photo
    );

    return GridTile(
      footer: Material(
        color: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(4)),
        ),
        clipBehavior: Clip.antiAlias,
        child: GridTileBar(
          backgroundColor: Colors.black45,
          // title: _GridTitleText(photo.title),
          // subtitle: _GridTitleText(photo.subtitle),
        ),
      ),
      child: image,
    );
  }
}