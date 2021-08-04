import 'package:flutter/foundation.dart';

class Article {
  final String title;
  final String imageUrl;
  final String articleUrl;
  final String publishedAt;
  final String description;
  Article(
      {this.title,
      this.imageUrl,
      this.articleUrl,
      this.publishedAt,
      this.description});
  factory Article.fromJson(Map article) 
  {
    return Article(title: article['title'],imageUrl: article['urlToImage'],articleUrl: article['url'],
    publishedAt: article['publishedAt'],description: article['description']);
  }
}
