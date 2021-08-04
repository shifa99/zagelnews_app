import 'package:flutter/material.dart';
import 'package:news_app_2021/models/article.dart';
import 'package:news_app_2021/modules/article_details_screen/article_details_screen.dart';
import 'package:news_app_2021/shared/components/components.dart';

class ArticleItem extends StatelessWidget {
  @required
  Article article;
  ArticleItem(this.article);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () 
      {
        Navigator.of(context).pushNamed(ArticleDetailsScreen.routeName,arguments: article);
      },
      child: Container(
        height: 130,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 130,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: article.imageUrl != null
                          ? imageNetworkCached(article.imageUrl)
                          : Center(child: Text('لا توجد صورة',style: Theme.of(context).textTheme.bodyText1,))),
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          article.title,
                          style: Theme.of(context).textTheme.bodyText1,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        article.description ?? 'تفاصيل الخبر',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
