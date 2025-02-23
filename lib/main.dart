import 'package:clean_architecture_movie_app/core/configs/app_theme.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/page_control/cubit/page_control_cubit.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/home_page.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependecies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PageControlCubit>(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.appTheme(context),
        title: 'Flutter Demo',
        home: HomePage(),
      ),
    );
  }
}
