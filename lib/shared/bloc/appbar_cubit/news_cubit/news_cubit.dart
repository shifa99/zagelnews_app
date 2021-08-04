import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2021/models/article.dart';
import 'package:news_app_2021/models/dio_helper.dart';
import 'package:news_app_2021/shared/bloc/appbar_cubit/news_cubit/news_cubit_states.dart';

class NewsCubit extends Cubit<NewsCubitStates> {
  NewsCubit(NewsCubitStates initialState) : super(initialState);
  List<Article> articles;
  static NewsCubit get(context) => BlocProvider.of(context);
  void getArticles({String category = 'sports'}) async {
    articles = [];
    emit(LoadingNewsState());
    await DioHelper.getData(query: 
    {
      'country': 'eg',
      'category': category,
      'apiKey': DioHelper.apiKey,
    }).then((value) 
    {
      value.data['articles'].forEach((element) {
        articles.add(Article.fromJson(element));
      });
      emit(SuccessLoadedState());
    }).catchError((error) {
      emit(ErrorLoadingState(error.toString()));
    });
  }
}
