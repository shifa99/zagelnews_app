import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2021/models/cached_helper.dart';
import 'package:news_app_2021/models/dio_helper.dart';
import 'package:news_app_2021/modules/article_details_screen/article_details_screen.dart';
import 'package:news_app_2021/modules/home_screen/news_screen.dart';
import 'package:news_app_2021/shared/bloc/app_cubit/app_cubit.dart';
import 'package:news_app_2021/shared/bloc/app_cubit/app_cubit_states.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/appbar_cubit.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit_states.dart';
import 'package:news_app_2021/shared/components/bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  DioHelper.initilize();
  await CachedHelper.initialize();
  bool isDark = CachedHelper.getBoolean('mode');
  runApp(MyApp(
    isDark: isDark,
  ));
}

class MyApp extends StatelessWidget {
  bool isDark;
  MyApp({this.isDark});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AppBarCubit(0),
          ),
          BlocProvider(
              create: (context) => NewsCubit(IdleNewsState())..getArticles()),
          BlocProvider(
              create: (context) => AppCubit()..changeMode(fromShared: isDark)),
        ],
        child: BlocConsumer<AppCubit, AppCubitStates>(
          listener: (context, state) {},
          builder: (context, state) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Zagel',
            routes: {
              ArticleDetailsScreen.routeName: (context) =>
                  ArticleDetailsScreen(),
            },
            theme: ThemeData(
              textTheme: TextTheme(
                headline6: TextStyle(color: Colors.black),
                bodyText2: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
                bodyText1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xff9DDAC6),
                  centerTitle: true,
                  titleTextStyle: TextStyle(color: Colors.black)),
              scaffoldBackgroundColor: Color(0xff9DDAC6),
              primarySwatch: Colors.blue,
            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Color(0xff082032),
              textTheme: TextTheme(
                  headline6: TextStyle(color: Colors.white),
                  bodyText1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  bodyText2: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  )),
              appBarTheme: AppBarTheme(
                  backgroundColor: Color(0xff082032), centerTitle: true),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: NewsScreen(),
          ),
        ));
  }
}
