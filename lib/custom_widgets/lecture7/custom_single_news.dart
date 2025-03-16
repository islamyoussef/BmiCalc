import 'package:blackhourses/models/news_cloud_models/article.dart';
import 'package:flutter/material.dart';

import '../../lecture7_tasks/frm_news_details.dart';
import 'custom_author_avatar.dart';

class CustomSingleNews extends StatelessWidget {

  const CustomSingleNews({super.key,required this.article});

  //  const CustomSingleNews(
  //     {super.key,
  //     required this.title,
  //     required this.details,
  //     required this.authorName,
  //     required this.noOfComments,
  //     required this.noOfViews,
  //     required this.imagePath,
  //     this.authorImage = 'assets/images/islam.jpg'});
  //
  // final String? title;
  //  final String? details;
  //  final String? authorName;
  //  final int noOfComments;
  //  final int noOfViews;
  //  final String? imagePath;
  //  final String? authorImage; //= 'assets/images/islam.jpg';

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffECECEC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(children: [
            // News Image
            Container(
              height: 150,
              decoration: BoxDecoration(
                // color: Colors.orange,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                        article.urlToImage.toString()
                    ),
                    fit: BoxFit.fill),
              ),
            ),

            // News title & some details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FrmNewsDetails(article:
                        Article(
                          author: article.author,
                                      title: article.title ,
                                      description: article.description,
                                      url: '',
                                      urlToImage:  article.urlToImage.toString() ,
                                      publishedAt: article.publishedAt ,
                                      content: article.content,
                                      source: article.source)
                        )
                        ,) );
                    },
                    child: Text(
                      article.title ?? 'No Title Loaded',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                 // Author Avatar article.publishedAt ??
                  CustomAuthorAvatar(publishedAt:  DateTime.now(), authorName: article.author, authorImagePath: 'assets/images/islam.jpg'),

                  // Details
                  Text(
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    article.content ?? 'No Details Loaded yet',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 7,),

            // Icons
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Colors.orangeAccent,
                      ),
                      SizedBox(width: 15),
                      Icon(
                        Icons.share,
                        color: Colors.orangeAccent,
                      ),
                    ],
                  ),
                  Row(children: [
                    Text(
                      '0 Comments',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.remove_red_eye,
                      size: 13,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '0 views',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    )
                  ])
                ],
              ),
            )

          ])),
    );
  }
}
