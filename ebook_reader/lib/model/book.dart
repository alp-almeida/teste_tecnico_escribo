class Book {

  int id;
  String title;
  String author;
  String coverUrl;
  String downloadUrl;

  Book(this.id, this.title, this.author, this.coverUrl, this.downloadUrl);

  factory Book.from(Map map){
    return Book(
      map['id'] ?? 0,
      map['title'] ?? '',
      map['author'] ?? '',
      map['cover_url'] ?? '',
      map['download_url'] ?? ''
    );
  }
}