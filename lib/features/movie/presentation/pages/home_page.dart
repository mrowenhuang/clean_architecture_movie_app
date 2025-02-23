import 'package:clean_architecture_movie_app/core/configs/app_color.dart';
import 'package:clean_architecture_movie_app/features/movie/presentation/bloc/page_control/cubit/page_control_cubit.dart';
import 'package:clean_architecture_movie_app/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final pageNumberCubit = sl<PageControlCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageControlCubit, int>(
      bloc: pageNumberCubit,
      builder: (context, state) {
        print(state);
        return Scaffold(
          body: Text(state.toString()),
          bottomNavigationBar: GNav(
            backgroundColor: AppColor.quaternary,
            onTabChange: (value) {
              pageNumberCubit.numberOfPage(value);
            },
            tabs: [
              GButton(
                icon: Icons.movie_creation_rounded,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              GButton(
                icon: Icons.search,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              GButton(
                icon: Icons.filter_list,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
              GButton(
                icon: Icons.bookmark_rounded,
                backgroundColor: AppColor.primary,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                borderRadius: BorderRadius.circular(10),
                iconActiveColor: AppColor.secondary,
                iconColor: AppColor.secondary,
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ],
          ),
        );
      },
    );
  }
}
