import 'package:flutter/material.dart';

import '../custom_widgets/lecture7/custom_single_news.dart';

class FrmHomeNews extends StatelessWidget {
  const FrmHomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Cloud",
              style: TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 25,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            // Category Title
            const Row(children: [
              Icon(Icons.arrow_right_rounded),
              Text(
                'Categories',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
            ]),

            // Horizontal carousel
            SizedBox(
              height: 150,
              child: CarouselView(
                scrollDirection: Axis.horizontal,
                itemExtent: double.infinity,
                children: List<Widget>.generate(10, (int index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //image: DecorationImage(image: AssetImage('assets/images/islam.jpg'), fit: BoxFit.fill),
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://picsum.photos/200?random=$index'),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text('News Head-Line')]),
                  );
                }),
              ),
            ),

            // News 1
            const CustomSingleNews(
              title: 'Russia reportedly presents demands that need to be met to end war in Ukraine',
              details: 'Russia has laid out a list of demands to U.S. authorities that need to be met in order for the war in Ukraine to end, Reuters reported',
              authorName: 'Islam A,Youssef',
              authorImage: 'assets/images/islam.jpg',
              noOfComments: 522,
              noOfViews: 10000,
              imagePath: 'https://picsum.photos/200?random=22',),

            // News 2
            const CustomSingleNews(
              title: 'Gazprom\'s grandeur fades as Europe abandons Russian gas',
              details: 'When the CEO of Russian state gas giant Gazprom opened a lavish building in St Petersburg to house the company\'s export arm 11 years ago',
              authorName: 'Islam A,Youssef',
              authorImage: 'assets/images/islam.jpg',
              noOfComments: 120,
              noOfViews: 1000,
              imagePath: 'https://picsum.photos/200?random=12',),

            // News 3
            const CustomSingleNews(
              title: 'Musk’s layoffs shrink workforce needed to realize Trump’s energy agenda',
              details: 'The mass layoffs of federal workers have slowed the government’s ability to permit some new energy projects in a',
              authorName: 'Islam A,Youssef',
              authorImage: 'assets/images/islam.jpg',
              noOfComments: 50,
              noOfViews: 800,
              imagePath: 'https://picsum.photos/200?random=13',),


            // News 4
            const CustomSingleNews(
              title: 'UN experts accuse Israel of genocidal acts and sexual violence in Gaza',
              details: 'Israel carried out "genocidal acts" against Palestinians by systematically destroying women\'s healthcare facilities during the',
              authorName: 'Islam A,Youssef',
              authorImage: 'assets/images/islam.jpg',
              noOfComments: 75,
              noOfViews: 2000,
              imagePath: 'https://picsum.photos/200?random=14',),


            // News 5
            const CustomSingleNews(
              title: 'US judge orders DOGE, Musk to produce cost-cutting records',
              details: 'A judge has ordered Elon Musk and his Department of Government Efficiency to answer questions describing their efforts to slash federal spending.',
              authorName: 'Islam A,Youssef',
              authorImage: 'assets/images/islam.jpg',
              noOfComments: 300,
              noOfViews: 1500,
              imagePath: 'https://picsum.photos/200?random=15',),


          ],
        ),
      ),
    );
  }
}
