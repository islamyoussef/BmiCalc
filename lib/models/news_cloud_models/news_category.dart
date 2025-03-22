
class NewsCategory{

  final int catID;
  final String catName;
  final String catImagePath;

  NewsCategory({required this.catID, required this.catName, required this.catImagePath});


  static List<NewsCategory> getListOfNewsCategories(){
    List<NewsCategory> list = [];
    list.add(NewsCategory(catID: 1, catName: 'politic', catImagePath: 'https://picsum.photos/200?random=1'));
    list.add(NewsCategory(catID: 2, catName: 'Business', catImagePath: 'https://picsum.photos/200?random=2'));
    list.add(NewsCategory(catID: 3, catName: 'Sports', catImagePath: 'https://picsum.photos/200?random=3'));
    list.add(NewsCategory(catID: 4, catName: 'Health', catImagePath: 'https://picsum.photos/200?random=4'));
    list.add(NewsCategory(catID: 5, catName: 'Technology', catImagePath: 'https://picsum.photos/200?random=5'));
    list.add(NewsCategory(catID: 6, catName: 'Science', catImagePath: 'https://picsum.photos/200?random=6'));
    list.add(NewsCategory(catID: 7, catName: 'PodCasts', catImagePath: 'https://picsum.photos/200?random=7'));

    return list;
  }

}