import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarCubit extends Cubit<int> {
  AppBarCubit(int initialState) : super(initialState);
  int index = 0;
  static AppBarCubit get(context) => BlocProvider.of(context);
  void changeIndex(int newIndex) 
  {
    index = newIndex;
    emit(index);
  }
}
