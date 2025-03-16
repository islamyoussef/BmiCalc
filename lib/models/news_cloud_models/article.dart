// https://newsapi.org/v2/top-headlines?country=us&apiKey=0b6db405bfe2467388e47d739fa5bc8d

class Article {
  final String author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final String content;
  final Source source;

  Article(
      {required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
        required this.content,
        required this.source});

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      author: json['author'] ?? 'No Author',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlToImage'],
      publishedAt: DateTime.parse(json['publishedAt']?? DateTime.now()),
      content: json['content'] ?? 'No content',
      source: json['source'],
    );
  }

// factory TopHeadlines.fromJson(Map<String, dynamic> jsonData) => TopHeadlines(
//     author: jsonData['author'].toString(),
//     title: jsonData['title'].toString(),
//     description: jsonData['description'].toString(),
//     url: jsonData['url'].toString(),
//     urlToImage: jsonData['urlToImage'].toString(),
//     publishedAt: jsonData['publishedAt'] ?? new DateTime.now(),
//     content: jsonData['content'].toString(),
//     source: jsonData['source']
// );

}

class Source{
  String? id;
  String? name;

  Source({this.id, this.name});
}