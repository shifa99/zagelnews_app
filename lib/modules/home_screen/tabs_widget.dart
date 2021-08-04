import 'package:flutter/material.dart';
import 'package:news_app_2021/models/categories.dart';
import 'package:news_app_2021/shared/styles/defaultTextStyles.dart';

List<Widget> tabs() {
  List<Widget> tabs = [];
  categories.forEach((element) {
    tabs.add(Text(
      element.nameAr.toString(),
      style: primaryTextStyle,
    ));
  });
  return tabs;
}
