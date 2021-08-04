import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app_2021/models/article.dart';
import 'package:news_app_2021/shared/components/components.dart';
import 'package:news_app_2021/shared/components/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleDetailsScreen extends StatelessWidget {
  static String routeName = 'articleDetailsScreen';
  Article article;
  @override
  Widget build(BuildContext context) {
    article = ModalRoute.of(context).settings.arguments as Article;
    return Scaffold(
        appBar: AppBar(
          title: Text('تفاصيل الخبر'),
        ),
        body: WebView(
          initialUrl: article.articleUrl,
        ));
  }
}
/*Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: kPadding,
            child: Text(
              article.title,
              style: Theme.of(context).textTheme.bodyText2,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
              flex: 2,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: article.imageUrl == null
                      ? Center(
                          child: Text('لا توجد صورة'),
                        )
                      : imageNetworkCached(article.imageUrl))),
          Expanded(
              flex: 2,
              child: Padding(
                padding: kPadding.copyWith(left: 10),
                child: Text(
                  article.description ?? ' ',
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  textAlign: TextAlign.center,
                ),
              )),
          Expanded(child: Container()),
          Padding(
            padding: kPadding,
            child: ElevatedButton(
             style: ElevatedButton.styleFrom(
               elevation: 10,
               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
               side: BorderSide(color: Colors.greenAccent)
             ),
              onPressed: ()async{
                              await launch(article.articleUrl);

            }, child: Text('شاهد تفاصيل الخبر')),
          ),
          
        ],
      ),*/
