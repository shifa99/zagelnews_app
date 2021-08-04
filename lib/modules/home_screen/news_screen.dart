import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2021/models/article.dart';
import 'package:news_app_2021/models/categories.dart';
import 'package:news_app_2021/modules/home_screen/listArticlesCategory.dart';
import 'package:news_app_2021/modules/home_screen/tabs_widget.dart';
import 'package:news_app_2021/shared/bloc/app_cubit/app_cubit.dart';
import 'package:news_app_2021/shared/bloc/app_cubit/app_cubit_states.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/appbar_cubit.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit_states.dart';
import 'package:news_app_2021/shared/styles/defaultTextStyles.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int index = 0;

  bool changeMode = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: categories.length,
        initialIndex: index,
        child: Scaffold(
          drawer: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Drawer(
              elevation: 20,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                          color: Colors.amberAccent,
                          child: Center(
                              child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'images/3DZagel.png',
                              fit: BoxFit.cover,
                            ),
                          )))),
                  ListTile(
                    leading: Icon(Icons.language),
                    title: Text('language'),
                    onTap: () {},
                  ),
                  ListTile(
                    onTap: () async {
                      await AppCubit.get(context).changeMode();
                    },
                    leading: Icon(Icons.brightness_4),
                    title: Text('Dark Mode'),
                    trailing: BlocBuilder<AppCubit, AppCubitStates>(
                        builder: (context, state) => Switch(
                            activeColor: Colors.black,
                            value: AppCubit.get(context).isDark,
                            onChanged: (newvalue) {
                              AppCubit.get(context).changeMode();
                            })),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(
            title: BlocBuilder<AppBarCubit, int>(builder: (context, state) {
              return Text(categories[AppBarCubit.get(context).index].nameAr);
            }),
            bottom: TabBar(
              onTap: (newIndex) {
                AppBarCubit.get(context).changeIndex(newIndex);
                NewsCubit.get(context)
                    .getArticles(category: categories[newIndex].nameEn);
                print(newIndex);
                index = newIndex;
              },
              physics: BouncingScrollPhysics(),
              isScrollable: true,
              tabs: tabs(),
              indicator: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          body: BlocConsumer<NewsCubit, NewsCubitStates>(
              listener: (_, states) {},
              builder: (context, state) {
                if (state is LoadingNewsState || state is IdleNewsState)
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.amberAccent,
                    ),
                  );
                else if (state is ErrorLoadingState)
                  return Center(
                    child: Text('عذرا حدث خطأ اثناء تحميل الاخبار'),
                  );
                List<Article> articles = NewsCubit.get(context).articles;
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: TabBarView(
                    children: listCategoryArticles(articles),
                  ),
                );
              }),
        ));
  }
}
