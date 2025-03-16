import 'package:blackhourses/custom_widgets/lecture7/custom_appbar.dart';
import 'package:blackhourses/custom_widgets/lecture7/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/lecture7/custom_author_avatar.dart';
import '../models/news_cloud_models/article.dart';

class FrmNewsDetails extends StatefulWidget {
  const FrmNewsDetails({super.key,required this.article});
  final Article article;

  @override
  State<FrmNewsDetails> createState() => _FrmNewsDetailsState();
}

class _FrmNewsDetailsState extends State<FrmNewsDetails> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.customAppbar(context,true),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // News Image
            Container(
              margin: const EdgeInsets.only(bottom: 7),
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.orange,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                      widget.article.urlToImage ),
                    fit: BoxFit.fill),
              ),
            ),

            // Title
            Text(
              widget.article.title ?? 'No Title Loaded',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),

            // Author Avatar
            CustomAuthorAvatar(publishedAt: widget.article.publishedAt?? DateTime.now(),
                authorName: widget.article.author,authorImagePath: 'assets/images/islam.jpg'),

            // Details
            Text(
              textAlign: TextAlign.justify,
              widget.article.content ?? 'No Content Loaded yet',
              maxLines: 15,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),

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
            ),
          ]),
    ),

    bottomNavigationBar:
        const CustomBottomNavBar(),
    );
  }
}
