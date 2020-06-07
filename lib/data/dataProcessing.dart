class NewsData {
  final String title;
  final String body;
  final String publisher;
  final String author;
  final String image;
  final String datePublished;

  NewsData(
      {this.title,
      this.body,
      this.publisher,
      this.author,
      this.image,
      this.datePublished});

  factory NewsData.fromJson(Map<String, dynamic> json) {
    return NewsData(
      title: json['title'],
      body: json['text'],
      publisher: json['publisher'],
      author: json['author'],
      image: json['image'],
      datePublished: json['date'],
    );
  }
}
