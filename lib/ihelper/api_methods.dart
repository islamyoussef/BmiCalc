
class ApiMethods{

  // Future<void> getTopHeadlines() async {
  //   final url = Uri.parse(
  //       'https://newsapi.org/v2/top-headlines?country=us&apiKey=${LocalVar.newsApiKey}');
  //   try {
  //     final response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       final body = response.body;
  //       final jsonData = jsonDecode(body);
  //       //print('Conntection Succeeded ......................');
  //       //print(jsonData['articles']);
  //       //topHeadlines = jsonData['articles'] ;
  //       //print(topHeadlines);
  //       setState(() {
  //         //topHeadlines = jsonData['articles']; //TopHeadlines.fromJson(jsonData) as List ;
  //         //topHeadlines = Article.fromJson(jsonData) as List<Article> ;
  //         topHeadlines = jsonData['articles'];
  //         _isLoading = false;
  //         //print('${topHeadlines[0]} Articles Loaded ......................');
  //       });
  //     } else {
  //       //print('Error ......................');
  //       throw Exception('Failed to load top headlines.......................');
  //     }
  //   } catch (ex) {
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

}