import 'package:blackhourses/custom_widgets/lecture7/custom_appbar.dart';
import 'package:blackhourses/custom_widgets/lecture7/custom_section_title.dart';
import 'package:blackhourses/models/news_cloud_models/news_category.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/lecture7/custom_single_news.dart';

class FrmHomeNews extends StatefulWidget {
  const FrmHomeNews({super.key});

  @override
  State<FrmHomeNews> createState() => _FrmHomeNewsState();
}

class _FrmHomeNewsState extends State<FrmHomeNews> {

  List<NewsCategory> listOfCats = NewsCategory.getListOfNewsCategories();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: CustomAppBar.customAppbar(context,false),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [

          // Section title [Categories]
          const CustomSectionTitle(sectionTitle: 'Categories'),

          // Horizontal carousel
          SizedBox(
            height: 150,
            child: CarouselView(
              scrollDirection: Axis.horizontal,
              itemExtent: double.infinity,
              children: List<Widget>.generate(listOfCats.length, (int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    //image: DecorationImage(image: AssetImage('assets/images/islam.jpg'), fit: BoxFit.fill),
                    image: DecorationImage(
                        image: NetworkImage(
                            //'https://picsum.photos/200?random=$index'
                            listOfCats[index].catImagePath
                            ),
                        fit: BoxFit.fill),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 50,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.5) // Specifies the background color and the opacity
                          ),
                          child: Center(
                            child: Text(
                              listOfCats[index].catName.toString(),
                              style: const TextStyle(
                              color: Colors.white54,
                              fontSize: 17,
                              fontWeight: FontWeight.w700
                            ),),
                          ),
                        ),

                      ]),
                );
              }),
            ),
          ),

          // Section title [Top Headlines]
          const CustomSectionTitle(sectionTitle: 'Top Headlines'),

          // static list of news
          fetchStatic(),

          /*********************/
          //CustomListNews()
          /*********************/

          // Get dynamic news from API
          TextButton(
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.all<Color>(Colors.orange),
                overlayColor: WidgetStateProperty.resolveWith<Color?>(
                      (Set<WidgetState> states)
                  {
                    if (states.contains(WidgetState.hovered)) {
                      return Colors.grey.withValues();
                    }
                    if (states.contains(WidgetState.focused) ||
                        states.contains(WidgetState.pressed)) {
                      return Colors.deepOrangeAccent.withValues();
                    }
                    return null; // Defer to the widget's default.
                  },
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/FrmTestApi');
              }, child: const Text('Dynamic Data'),

          )

        ]),
      ),
    );
  }

  Widget fetchStatic() {
    return const Column(
      children: [
        // News 1
        CustomSingleNews(
          title:
              'Russia reportedly presents demands that need to be met to end war in Ukraine',
          details:
              'Russia has laid out a list of demands to U.S. authorities that need to be met in order for the war in Ukraine to end, Reuters reported',
          authorName: 'Islam A,Youssef',
          //authorImage: 'assets/images/islam.jpg',
          noOfComments: 522,
          noOfViews: 10000,
          imagePath: 'https://picsum.photos/200?random=22',
        ),

        // News 2
        CustomSingleNews(
          title: 'Gazprom\'s grandeur fades as Europe abandons Russian gas',
          details:
              'When the CEO of Russian state gas giant Gazprom opened a lavish building in St Petersburg to house the company\'s export arm 11 years ago',
          authorName: 'Islam A,Youssef',
          //authorImage: 'assets/images/islam.jpg',
          noOfComments: 120,
          noOfViews: 1000,
          imagePath: 'https://picsum.photos/200?random=12',
        ),

        // News 3
        CustomSingleNews(
          title:
              'Musk’s layoffs shrink workforce needed to realize Trump’s energy agenda',
          details:
              'The mass layoffs of federal workers have slowed the government’s ability to permit some new energy projects in a',
          authorName: 'Islam A,Youssef',
          //authorImage: 'assets/images/islam.jpg',
          noOfComments: 50,
          noOfViews: 800,
          imagePath: 'https://picsum.photos/200?random=13',
        ),

        // News 4
        CustomSingleNews(
          title:
              'UN experts accuse Israel of genocidal acts and sexual violence in Gaza',
          details:
              'Israel carried out "genocidal acts" against Palestinians by systematically destroying women\'s healthcare facilities during the',
          authorName: 'Islam A,Youssef',
          //authorImage: 'assets/images/islam.jpg',
          noOfComments: 75,
          noOfViews: 2000,
          imagePath: 'https://picsum.photos/200?random=14',
        ),

        // News 5
        CustomSingleNews(
          title: 'US judge orders DOGE, Musk to produce cost-cutting records',
          details:
              'A judge has ordered Elon Musk and his Department of Government Efficiency to answer questions describing their efforts to slash federal spending.',
          authorName: 'Islam A,Youssef',
          //authorImage: 'assets/images/islam.jpg',
          noOfComments: 300,
          noOfViews: 1500,
          imagePath: 'https://picsum.photos/200?random=15',
        ),
      ],
    );
  }
}
