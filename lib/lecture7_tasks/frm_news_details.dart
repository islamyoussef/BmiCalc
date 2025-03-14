import 'package:blackhourses/custom_widgets/lecture7/custom_appbar.dart';
import 'package:blackhourses/lecture7_tasks/frm_home_news.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/lecture7/custom_author_avatar.dart';

class FrmNewsDetails extends StatelessWidget {
  FrmNewsDetails({super.key, required this.title, required this.details,required this.authorName, required this.noOfComments, required this.noOfViews, required this.imagePath, this.authorImage='assets/images/islam.jpg'});

  String title;
  String details;
  String authorName;
  int noOfComments;
  int noOfViews;
  String imagePath;
  String authorImage; //= 'assets/images/islam.jpg';

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
              height: 250,
              decoration: BoxDecoration(
                // color: Colors.orange,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                image: DecorationImage(
                    image: NetworkImage(
                      imagePath ?? 'https://picsum.photos/400?random=1'),
                    fit: BoxFit.fill),
              ),
            ),

            const SizedBox(height: 7),

            // Title
            Text(
              title ?? 'No Title Loaded',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 7),

            // Author Avatar
            CustomAuthorAvatar(authorName: authorName, authorImagePath: authorImage.toString()),

            const SizedBox(height: 7),

            // Details
            Text(
              textAlign: TextAlign.justify,
              details ?? 'No Details Loaded yet',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),

            // Icons
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
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
                      '$noOfComments Comments',
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(width: 15),
                    const Icon(
                      Icons.remove_red_eye,
                      size: 13,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      '$noOfViews views',
                      style: const TextStyle(
                          color: Colors.black45,
                          fontSize: 13,
                          fontWeight: FontWeight.w700),
                    )
                  ])
                ],
              ),
            ),

            FloatingActionButton.small(onPressed: (){
              //Navigator.pushNamedAndRemoveUntil(context, , predicate)
              Navigator.pushNamedAndRemoveUntil(context, '/FrmTestApi', ModalRoute.withName('/'));
              //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const FrmHomeNews(),), (route) => '',)
            },
            child: Icon(Icons.home,color: Colors.deepOrangeAccent,),)
          ]

        ),
        /*********************/
      ),
    );
  }
}
