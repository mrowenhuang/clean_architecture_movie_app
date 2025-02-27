import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/page_control/cubit/page_control_cubit.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/bookmark/bookmark_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/filter/filter_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/home/home_movie_page.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List page = [
    const HomeMoviePage(),
    SearchPage(),
    const FilterPage(),
    const BookmarkPage()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageControlCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: page[state],
          bottomNavigationBar: GNav(
            backgroundColor: AppColor.quaternary,
            selectedIndex: state,
            onTabChange: (value) {
              context.read<PageControlCubit>().numberOfPage(value);
            },
            tabs: [
              GButton(
                icon: Icons.movie_creation_rounded,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              ),
              GButton(
                icon: Icons.search,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              ),
              GButton(
                icon: Icons.filter_list,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              ),
              GButton(
                icon: Icons.bookmark_border_rounded,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              ),
            ],
          ),
        );
      },
    );
  }
}
