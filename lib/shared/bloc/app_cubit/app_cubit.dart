import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_2021/models/cached_helper.dart';
import 'package:news_app_2021/shared/bloc/app_cubit/app_cubit_states.dart';

class AppCubit extends Cubit<AppCubitStates> {
  AppCubit() : super(IdleModeApp());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isDark = true;
  Future<void> changeMode({bool fromShared}) async {
    //first time
    if (fromShared != null)
      isDark = fromShared;
    else {
      print('Enter to change');
      isDark = !isDark;
      await CachedHelper.setData('mode', isDark);
      emit(ChangeModeApp());
    }
  }
}
