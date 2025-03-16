import 'package:flutter/material.dart';
import 'custom_single_news.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CustomListNews extends StatefulWidget {
  const CustomListNews({super.key});

  @override
  State<CustomListNews> createState() => _CustomListNewsState();
}

class _CustomListNewsState extends State<CustomListNews> {

  List<dynamic> topHeadlines = [];
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTopHeadlines();
    //print('\n \n \n ISLAM On Load >>>>>>>>>>>>>>>>>> ${topHeadlines.length.toString()} \n \n \n');
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topHeadlines.length,
      itemBuilder: (context, index) {
        //Text('${topHeadlines[index]['title']}');
        return CustomSingleNews(article: topHeadlines[index]);
      },
    );
  }

  Future<void> getTopHeadlines() async {
    final url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=0b6db405bfe2467388e47d739fa5bc8d');
    try {
      //print(response.statusCode );
      final response = await http.get(url);
      if (response.statusCode == 200) {
        print('Success ......................');

        final body = response.body;
        final jsonData = jsonDecode(body);

        setState(() {
          topHeadlines =
          jsonData['articles']; //TopHeadlines.fromJson(jsonData) as List ;
          _isLoading = false;
        });
      } else {
        print('Error ......................');
        throw Exception('Failed to load top headlines.');
      }
    } catch (ex) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $ex .....................')),
      );
    }
  }


}
