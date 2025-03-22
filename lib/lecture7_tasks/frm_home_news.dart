import 'package:blackhourses/custom_widgets/lecture7/custom_appbar.dart';
import 'package:blackhourses/custom_widgets/lecture7/custom_category.dart';
import 'package:blackhourses/custom_widgets/lecture7/custom_section_title.dart';
import 'package:blackhourses/ihelper/local_var.dart';
import 'package:blackhourses/models/news_cloud_models/article.dart';
import 'package:blackhourses/models/news_cloud_models/news_category.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/lecture7/custom_bottom_nav_bar.dart';
import '../custom_widgets/lecture7/custom_single_news.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class FrmHomeNews extends StatefulWidget {
  const FrmHomeNews({super.key});

  @override
  State<FrmHomeNews> createState() => _FrmHomeNewsState();
}

class _FrmHomeNewsState extends State<FrmHomeNews> {

  List<NewsCategory> listOfCats = NewsCategory.getListOfNewsCategories();
  List<dynamic> topHeadlines = [];
  int noOfNews = 0;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTopHeadlines();
    noOfNews = topHeadlines.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: CustomAppBar.customAppbar(context, false),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          // Section title [Categories]
          const CustomSectionTitle(sectionTitle: 'Categories'),

          // Horizontal carousel [listView]
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listOfCats.length,
              itemBuilder: (context, index) {
                return CustomCategory(category: listOfCats[index]);
              },
            ),
          ),

          // Section title [Top Headlines]
          CustomSectionTitle(sectionTitle: 'Top Headlines [${noOfNews.toString() ?? ''}]'),

          // Top Headlines
          Expanded(
            child: _isLoading? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ) : ListView.builder(
              itemCount: topHeadlines.length,
              itemBuilder: (context, index) {
                //Text('${topHeadlines[index]['title']}');
                return CustomSingleNews(
                    article: Article(
                        title:
                            topHeadlines[index]['title'] ?? 'No Title Loaded',
                        author: topHeadlines[index]['author'] ??
                            'No Author Name Loaded',
                        content: topHeadlines[index]['content'] ??
                            'No Content Loaded',
                        description: topHeadlines[index]['description'] ??
                            'No description Loaded',
                        url: topHeadlines[index]['url'] ?? 'No Url Loaded',
                        source: Source(id: '0', name: 'yahoo news'),
                        publishedAt:
                            DateTime.parse(topHeadlines[index]['publishedAt']),
                        urlToImage: topHeadlines[index]['urlToImage'] ??
                            'https://placehold.co/150x150/png'));
              },
            ),
          ),

          // Get dynamic news from API
        ]),
      ),

      bottomNavigationBar:
      const CustomBottomNavBar(),
    );
  }

  Future<void> getTopHeadlines() async {
    // https://newsapi.org/v2/top-headlines?country=us&apiKey=0b6db405bfe2467388e47d739fa5bc8d
    final url = Uri.parse(
        '${LocalVar.newsApiEndPoint}/v2/top-headlines?country=us&apiKey=${LocalVar.newsApiKey}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final jsonData = jsonDecode(body);
        //print('Conntection Succeeded ......................');
        //print(jsonData['articles']);
        //topHeadlines = jsonData['articles'] ;
        //print(topHeadlines);
        setState(() {
          //topHeadlines = jsonData['articles']; //TopHeadlines.fromJson(jsonData) as List ;
          //topHeadlines = Article.fromJson(jsonData) as List<Article> ;
          topHeadlines = jsonData['articles'];
          noOfNews = topHeadlines.length;
          _isLoading = false;
          //print('${topHeadlines[0]} Articles Loaded ......................');
        });
      } else {
        //print('Error ......................');
        throw Exception('Failed to load top headlines.......................');
      }
    } catch (ex) {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
