import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../custom_widgets/lecture7/custom_appbar.dart';
import '../custom_widgets/lecture7/custom_bottom_nav_bar.dart';
import '../custom_widgets/lecture7/custom_section_title.dart';
import '../custom_widgets/lecture7/custom_single_news.dart';
import '../ihelper/local_var.dart';
import '../models/news_cloud_models/article.dart';

class FrmNewsCategory extends StatefulWidget {
  const FrmNewsCategory({super.key, required this.categoryName});

  final String categoryName;

  @override
  State<FrmNewsCategory> createState() => _FrmNewsCategoryState();
}

class _FrmNewsCategoryState extends State<FrmNewsCategory> {

  List<dynamic> newsCategoryResult = [];
  int noOfNews = 0;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getResult();
    noOfNews = newsCategoryResult.length;
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
          CustomSectionTitle(sectionTitle: widget.categoryName.toString()),

          // Search Result
          Expanded(
            child:  _isLoading? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ) :ListView.builder(
              itemCount: newsCategoryResult.length,
              itemBuilder: (context, index) {
                //Text('${topHeadlines[index]['title']}');
                return CustomSingleNews(
                    article: Article(
                        title:
                        newsCategoryResult[index]['title'] ?? 'No Title Loaded',
                        author: newsCategoryResult[index]['author'] ??
                            'No Author Name Loaded',
                        content: newsCategoryResult[index]['content'] ??
                            'No Content Loaded',
                        description: newsCategoryResult[index]['description'] ??
                            'No description Loaded',
                        url: newsCategoryResult[index]['url'] ?? 'No Url Loaded',
                        source: Source(id: '0', name: 'yahoo news'),
                        publishedAt:
                        DateTime.parse(newsCategoryResult[index]['publishedAt']),
                        urlToImage: newsCategoryResult[index]['urlToImage'] ??
                            'https://placehold.co/150x150/png'));
              },
            ),
          ),

        ]),
      ),

      bottomNavigationBar:
      const CustomBottomNavBar(),
    );
  }

  Future<void> getResult() async {
    // https://newsapi.org/v2/top-headlines?category=business&apiKey=0b6db405bfe2467388e47d739fa5bc8d
    final url = Uri.parse(
        '${LocalVar.newsApiEndPoint}/v2/top-headlines?category=${widget.categoryName}&apiKey=${LocalVar.newsApiKey}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final jsonData = jsonDecode(body);
        setState(() {
          newsCategoryResult = jsonData['articles'];
          noOfNews = newsCategoryResult.length;
          _isLoading = false;
        });
      } else {
        //print('Error ......................');
        throw Exception('Failed to load category.......................');
      }
    } catch (ex) {
      setState(() {
        _isLoading = false;
      });
    }
  }

}
