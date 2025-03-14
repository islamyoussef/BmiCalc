// https://newsapi.org/v2/top-headlines?country=us&apiKey=0b6db405bfe2467388e47d739fa5bc8d

class TopHeadlines {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publishedAt;
  String? content;
  Source? source;

  TopHeadlines(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.source});

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

  factory TopHeadlines.fromJson(Map<String, dynamic> json) {
    return TopHeadlines(
      author: json['author'] ?? 'No Author',
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      url: json['url'] ?? '',
      urlToImage: json['urlImage'] ?? '',
      publishedAt: DateTime.parse(json['publishedAt']),
    );
  }

}

class Source{
  String? id;
  String? name;

  Source({this.id, this.name});

}