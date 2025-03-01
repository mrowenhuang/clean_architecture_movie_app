// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:clean_architecture_movie_app/features/movie/data/datasources/remote/remote_data_sorces.dart';

void main() async {
  final resposne = await RemoteDataSorcesImpl().getTopRatedMovies();

  print(resposne);
}
