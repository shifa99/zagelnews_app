import 'package:flutter/material.dart';
import 'package:news_app_2021/models/article.dart';
import 'package:news_app_2021/models/categories.dart';
import 'package:news_app_2021/modules/home_screen/article_item.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit.dart';

List<Widget> listCategoryArticles(List<Article> articles) 
{
  List<Widget> categoryArticles = [];
  categories.forEach((element) {
    categoryArticles.add(ListCategoryArticles(articles: articles));
  });
  return categoryArticles;
}

class ListCategoryArticles extends StatelessWidget {
  const ListCategoryArticles({
    Key key,
    @required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    print('length : ${articles.length}');
    return articles.length == 0
        ? Center(
            child: Text('لا توجد اخبار الأن'),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => ArticleItem(articles[index]),
            separatorBuilder: (context, index) => Divider(
                  height: 1,
                ),
            itemCount: NewsCubit.get(context).articles.length);
  }
}
