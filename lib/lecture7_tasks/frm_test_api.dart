import 'dart:convert';

import 'package:blackhourses/custom_widgets/lecture7/custom_appbar.dart';
import 'package:blackhourses/custom_widgets/lecture7/custom_section_title.dart';
import 'package:blackhourses/models/news_cloud_models/top_headlines.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/lecture7/custom_single_news.dart';
import 'package:http/http.dart' as http;

class FrmTestApi extends StatefulWidget {
  const FrmTestApi({super.key});

  @override
  State<FrmTestApi> createState() => _FrmTestApiState();
}

class _FrmTestApiState extends State<FrmTestApi> {

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
    return Scaffold(
        appBar: CustomAppBar.customAppbar(),

        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: topHeadlines.length,
              itemBuilder: (context, index) {
                //Text('${topHeadlines[index]['title']}');
                return CustomSingleNews(
                    title: topHeadlines[index]['title']?? 'No Title Loaded',
                    details: topHeadlines[index]['content']?? 'No Content Loaded',
                    authorName: topHeadlines[index]['author'] ?? 'No Author Name Loaded',
                    noOfComments: index,
                    noOfViews: index,
                    imagePath: topHeadlines[index]['urlToImage'] ?? 'https://picsum.photos/400?random=$index');
              },
            )
            /*********************/
            ));
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
