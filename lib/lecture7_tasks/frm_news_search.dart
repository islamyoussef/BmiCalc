
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../custom_widgets/lecture7/custom_appbar.dart';
import '../custom_widgets/lecture7/custom_bottom_nav_bar.dart';
import '../custom_widgets/lecture7/custom_section_title.dart';
import '../custom_widgets/lecture7/custom_single_news.dart';
import '../ihelper/local_var.dart';
import '../models/news_cloud_models/article.dart';

class FrmNewsSearch extends StatefulWidget {
  const FrmNewsSearch({super.key});

  @override
  State<FrmNewsSearch> createState() => _FrmNewsSearchState();
}

class _FrmNewsSearchState extends State<FrmNewsSearch> {

  TextEditingController txtSearch = TextEditingController();
  List<dynamic> newsSearchResult = [];
  int noOfNews = 0;
  bool _isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print(txtSearch.text);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    txtSearch.dispose();
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
          const CustomSectionTitle(sectionTitle: 'Search ...'),

          // Search text field
          SizedBox(
            width: 400,
            height: 60,
            child: TextField(

              controller: txtSearch,
              textAlign: TextAlign.center,
              autofocus: true,
              style: const TextStyle(
                color: Colors.orange
              ),
              decoration: InputDecoration(
                hintText: 'Enter a search term',
                border: const OutlineInputBorder(),
                suffixIcon: InkWell(child: const Icon(Icons.search),
                  onTap: (){
                    getResult(txtSearch.text);
                    //print(noOfNews);
                  },
                ),
              ),



            ),
          ),

          // Section title
          CustomSectionTitle(sectionTitle: 'Search Result [${noOfNews.toString() ?? ''}]'),

          // Search Result
          Expanded(
            child:  _isLoading? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            ) :ListView.builder(
              itemCount: newsSearchResult.length,
              itemBuilder: (context, index) {
                //Text('${topHeadlines[index]['title']}');
                return CustomSingleNews(
                    article: Article(
                        title:
                        newsSearchResult[index]['title'] ?? 'No Title Loaded',
                        author: newsSearchResult[index]['author'] ??
                            'No Author Name Loaded',
                        content: newsSearchResult[index]['content'] ??
                            'No Content Loaded',
                        description: newsSearchResult[index]['description'] ??
                            'No description Loaded',
                        url: newsSearchResult[index]['url'] ?? 'No Url Loaded',
                        source: Source(id: '0', name: 'yahoo news'),
                        publishedAt:
                        DateTime.parse(newsSearchResult[index]['publishedAt']),
                        urlToImage: newsSearchResult[index]['urlToImage'] ??
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



  Future<void> getResult(String query) async {
    // https://newsapi.org/v2/everything?q=bitcoin&apiKey=0b6db405bfe2467388e47d739fa5bc8d
    final url = Uri.parse(
        '${LocalVar.newsApiEndPoint}/v2/everything?q=$query&apiKey=${LocalVar.newsApiKey}');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final body = response.body;
        final jsonData = jsonDecode(body);
        setState(() {
          newsSearchResult = jsonData['articles'];
          noOfNews = newsSearchResult.length;
          _isLoading = false;
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
