import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/top_rated_movie/pages/home_page.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/material.dart';

void main() async {
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme,
      title: 'Flutter Demo',
      home: const HomePage(),
    );
  }
}
