import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageControlCubit extends Cubit<int> {
  PageControlCubit() : super(0);

  void numberOfPage(int pageNumber) {
    emit(pageNumber);
  }
}
