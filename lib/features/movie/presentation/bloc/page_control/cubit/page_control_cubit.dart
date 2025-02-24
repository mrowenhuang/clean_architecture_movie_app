import 'package:flutter_bloc/flutter_bloc.dart';

class PageControlCubit extends Cubit<int> {
  PageControlCubit() : super(1);

  void numberOfPage(int pageNumber) {
    emit(pageNumber);
  }
}
