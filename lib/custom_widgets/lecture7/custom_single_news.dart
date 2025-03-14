import 'package:blackhourses/custom_widgets/lecture7/custom_author_avatar.dart';
import 'package:blackhourses/lecture7_tasks/frm_news_details.dart';
import 'package:flutter/material.dart';

class CustomSingleNews extends StatelessWidget {
   const CustomSingleNews(
      {super.key,
      required this.title,
      required this.details,
      required this.authorName,
      required this.noOfComments,
      required this.noOfViews,
      required this.imagePath,
      this.authorImage = 'assets/images/islam.jpg'});

  final String? title;
   final String? details;
   final String? authorName;
   final int noOfComments;
   final int noOfViews;
   final String? imagePath;
   final String? authorImage; //= 'assets/images/islam.jpg';

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
                //image: DecorationImage(image: AssetImage('assets/images/islam.jpg'), fit: BoxFit.fill),
                //image: const DecorationImage(image: NetworkImage('https://placehold.co/150x150/png'), fit: BoxFit.fill),
                image: DecorationImage(
                    image: NetworkImage(
                        imagePath ?? 'https://picsum.photos/400?random=1'),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FrmNewsDetails(
                                title: title ?? '',
                                details: details ?? '',
                                noOfComments: noOfComments ?? 0,
                                noOfViews: noOfViews ?? 0,
                                imagePath: imagePath ?? 'https://picsum.photos/400?random=1',
                                authorName: authorName ?? 'Islam A,Youssef',
                                authorImage: authorImage ?? 'assets/images/islam.jpg'),
                          ));
                    },
                    child: Text(
                      title ?? 'No Title Loaded',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  // Author Avatar
                  CustomAuthorAvatar(authorName: 'Islam A,Youssef', authorImagePath: authorImage.toString()),

                  const SizedBox(
                    height: 5,
                  ),

                  // Details
                  Text(
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    details == null ? 'No Details Loaded yet' : '$details ...',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
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
            )

          ])),
    );
  }
}
